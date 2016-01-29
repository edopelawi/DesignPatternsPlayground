//
//  FlyweightSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum FlyweightSampleDuplicationMethod: String {
    case Clone = "Clone"
    case Flyweight = "Flyweight"
}

class FlyweightSampleViewModel {
    
    
    // MARK: Public properties
    internal var selectedDuplicationMethod = FlyweightSampleDuplicationMethod.Clone
    
    internal var duplicationMethodOptions = [
        FlyweightSampleDuplicationMethod.Clone,
        FlyweightSampleDuplicationMethod.Flyweight
    ]
    
    /// Number of monsters that will be spawned for each `MonsterInvader` in `monsterInvaders` property.
    internal var numberPerType = 0
    
    internal var usedMemoryString = "0 byte"
    internal var monsterInvaders = [MonsterInvader]() {
        didSet {
            updateUsedMemoryString()
        }
    }
    
    // MARK: Private properties
    private var selectedMonsterIcons = Set<String>()
    private var invaderFlyweightFactory = MonsterInvaderFlyweightFactory()
    
    // MARK: Public methods
    
    /// Add passed `icon` to list of generated monster types during invasion.
    /// - note: If a same `icon` found, nothing will be happened.
    internal func addMonsterIcon(icon: String) {
        selectedMonsterIcons.insert(icon)
    }
    
    /// Remove passed `icon` from list of generated monster types during invasion.
    /// - note: If there's no `icon` found, nothing will be happened.
    internal func removeMonsterIcon(icon: String) {
        selectedMonsterIcons.remove(icon)
    }
    
    internal func startInvasion(finishedClosure finishedClosure: (Void)->(Void) ) {
        
        usedMemoryString = "Calculating..."
        generateMonsterInvaders(finishedClosure: finishedClosure)
    }
    
    // MARK: Private methods 
    
    private func generateMonsterInvaders(finishedClosure finishedClosure: (Void) -> (Void)) {
    
        
        let queuePriority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(queuePriority, 0)) {
            [weak self] in
            
            guard let strongSelf = self else {
                return
            }
            
            var newMonsterInvaders = [MonsterInvader]()
            
            for _ in 1...strongSelf.numberPerType {
                
                for monsterIcon in strongSelf.selectedMonsterIcons {
                    
                    let newMonster = strongSelf.generateMonsterInvaderWithCurrentMethod(monsterIcon: monsterIcon)
                    newMonsterInvaders.append(newMonster)
                }
            }
            
            strongSelf.monsterInvaders = newMonsterInvaders
            finishedClosure()
        }
    }
    
    private func generateMonsterInvaderWithCurrentMethod(monsterIcon monsterIcon: String) -> MonsterInvader {
        
        switch selectedDuplicationMethod {
        case .Clone:
            
            let invader = MonsterInvader()
            invader.icon = monsterIcon
            return invader
            
        case .Flyweight: return invaderFlyweightFactory.retrieveInvaderWithIcon(monsterIcon)
        }
    }
    
    private func updateUsedMemoryString() {
        
        var sizePerMemory = [String: Int]()
        
        for invader in monsterInvaders {
            
            let invaderMemoryAddress = "\(unsafeAddressOf(invader))"
            let addressCounted = sizePerMemory[invaderMemoryAddress] != nil
            
            if addressCounted {
                return
            }
            
            var invaderBuffer = invader
            let invaderSize = malloc_size(&invaderBuffer)
            
            sizePerMemory[invaderMemoryAddress] = invaderSize
        }
        
        var totalSize = 0
        
        for (_, size) in sizePerMemory {

            totalSize += size
        }
        
        // TODO: Refactor this assignment below to add conversion to KB, MB, etc.
        
        usedMemoryString = "\(totalSize) bytes"        
    }
    
}