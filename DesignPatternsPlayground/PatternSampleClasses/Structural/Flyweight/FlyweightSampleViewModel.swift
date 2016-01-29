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

protocol FlyweightSampleViewModelDelegate: class {
    
    /// Called when viewModel's `monsterInvaders` property is being updated.
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersStartUpdating: Void)
    
    /// Called when `viewModel`'s `monsterInvaders` property is updated.
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersUpdated: [MonsterInvader])
    
    /// Called when `viewModel`'s `usedMemoryString` property is updated.
    func viewModel(viewModel: FlyweightSampleViewModel, usedMemoryStringUpdated: String)
    
    /// Called when `viewModel`'s `selectedDuplicationMethod` property is updated.
    func viewModel(viewModel: FlyweightSampleViewModel, duplicationMethodUpdated: FlyweightSampleDuplicationMethod)
}

class FlyweightSampleViewModel {    
    
    // MARK: Public properties
    internal var selectedDuplicationMethod = FlyweightSampleDuplicationMethod.Clone {
        didSet {
            for (_, delegate) in delegates {
                delegate.viewModel(self, duplicationMethodUpdated: selectedDuplicationMethod)
            }
        }
    }
    
    internal var duplicationMethodOptions = [
        FlyweightSampleDuplicationMethod.Clone,
        FlyweightSampleDuplicationMethod.Flyweight
    ]
    
    /// Number of monsters that will be spawned for each `MonsterInvader` in `monsterInvaders` property.
    internal var numberPerType = 0
    
    internal private(set) var usedMemoryString = "0 byte" {
        didSet {
            for (_, delegate) in delegates {
                delegate.viewModel(self, usedMemoryStringUpdated: usedMemoryString)
            }
        }
    }
    
    internal private(set) var monsterInvaders = [MonsterInvader]() {
        didSet {
            updateUsedMemoryString()
            for (_, delegate) in delegates {
                delegate.viewModel(self, monsterInvadersUpdated:monsterInvaders)
            }
        }
    }
    
    // MARK: Private properties
    private var selectedMonsterIcons = Set<String>()
    private var invaderFlyweightFactory = MonsterInvaderFlyweightFactory()
    
    private var delegates = [String: FlyweightSampleViewModelDelegate]()
    
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
    
    /// Populates this instance's `monsterInvaders` with current settings. Will invoke corresponding delegate methods.
    internal func startInvasion() {
        
        for (_, delegate) in delegates {
            delegate.viewModel(self, monsterInvadersStartUpdating: Void() )
        }
        
        let queuePriority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(queuePriority, 0)) {
            [weak self] in
            
            guard let strongSelf = self else {
                return
            }
            
            let newInvaders = strongSelf.generateNewMonsterInvadersWithCurrentSettings()
            
            dispatch_async(dispatch_get_main_queue(), {
                _ in
                
                strongSelf.monsterInvaders = newInvaders
                
            })
        }
        
    }
    
    /// Add passed `delegate` to this instance's delegates. Nothing will happen if it's already as a delegate.
    internal func addDelegate(delegate: FlyweightSampleViewModelDelegate) {

        let delegateAddress = "\(unsafeAddressOf(delegate))"
        let delegateAdded = delegates[delegateAddress] != nil
        
        if delegateAdded {
            return
        }
        
        delegates[delegateAddress] = delegate
    }
    
    /// Remove passed `delegate` from this instance's delegates. Nothing will happen if it's not added as delegate yet.
    internal func removeDelegate(delegate: FlyweightSampleViewModelDelegate) {
        
        let delegateAddress = "\(unsafeAddressOf(delegate))"
        delegates[delegateAddress] = nil
    }
    
    // MARK: Private methods 
    
    private func generateNewMonsterInvadersWithCurrentSettings() -> [MonsterInvader] {
    
        if numberPerType <= 0 {
            return []
        }
        
        var newMonsterInvaders = [MonsterInvader]()
        
        for _ in 0...numberPerType-1 {
            
            for monsterIcon in selectedMonsterIcons {
                
                let newMonster = generateMonsterInvaderWithCurrentMethod(monsterIcon: monsterIcon)
                newMonsterInvaders.append(newMonster)
            }
        }
        
        return newMonsterInvaders
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
        
        usedMemoryString = "Calculating..."
        
        let queuePriority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(queuePriority, 0), {
            [weak self] _ in
            
            guard let strongSelf = self else {
                return
            }
            
            let totalSize = strongSelf.calculateUsedMemoryForCurrentInvaders()
            
            dispatch_async(dispatch_get_main_queue(), {
                _ in

                // TODO: Refactor this assignment below to add conversion to KB, MB, etc.
                
                self?.usedMemoryString = "\(totalSize) bytes"
            })
        })
    }
    
    private func calculateUsedMemoryForCurrentInvaders() -> Int {
        
        var sizePerMemory = [String: Int]()
        
        for invader in monsterInvaders {
            
            let invaderMemoryAddress = "\(unsafeAddressOf(invader))"
            let addressCounted = sizePerMemory[invaderMemoryAddress] != nil
            
            if addressCounted {
                break
            }
            
            var invaderBuffer = invader
            let invaderSize = malloc_size(&invaderBuffer)
            
            sizePerMemory[invaderMemoryAddress] = invaderSize
        }
        
        var totalSize = 0
        
        for (_, size) in sizePerMemory {
            
            totalSize += size
        }
        
        return totalSize
    }
    
}