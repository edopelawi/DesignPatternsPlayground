//
//  DecoratorSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum DecoratorSampleViewModelMoves: String {
    case Punch = "Punch"
    case Kick = "Kick"
}

enum DecoratorSampleViewModelArmaments: String {

    case None = "None"
    case Fire = "Fire"
    case Ice = "Ice"
    case Thunder = "Thunder"
    case FireIce = "Fire + Ice"
    case FireThunder = "Fire + Thunder"
    case IceThunder = "Ice + Thunder"
    case FireIceThunder = "Fire + Ice + Thunder"
    
}

protocol DecoratorSampleViewModelDelegate: class {
    
    /// Executed when `viewModel`'s `selectedFightingMove` is updated.
    func selectedFightingMoveUpdated(viewModel: DecoratorSampleViewModel, selectedFightingMove: DecoratorSampleViewModelMoves)
    
    /// Executed when `viewModel`'s `selectedArmament` is updated.
    func selectedArmamentUpdated(viewModel: DecoratorSampleViewModel, selectedArmament: DecoratorSampleViewModelArmaments)
    
    /// Executed when `viewModel`'s `resultMove` is updated.
    func resultMoveUpdated(viewModel: DecoratorSampleViewModel, resultMove: String)
}

class DecoratorSampleViewModel {
    
    private var fighter: FightingMoves! {
        didSet {
            updateResultMove()
        }
    }
    
    weak internal var delegate: DecoratorSampleViewModelDelegate?
    
    internal var resultMove = "" {
        didSet {
            delegate?.resultMoveUpdated(self, resultMove: resultMove)
        }
    }
    
    internal var fightingMoveOptions = [
        DecoratorSampleViewModelMoves.Punch,
        DecoratorSampleViewModelMoves.Kick
    ]
    
    internal var selectedFightingMove = DecoratorSampleViewModelMoves.Punch {
        didSet {
            updateResultMove()
            delegate?.selectedFightingMoveUpdated(self, selectedFightingMove: selectedFightingMove)
        }
    }
    
    internal var armamentOptions = [
        DecoratorSampleViewModelArmaments.None,
        DecoratorSampleViewModelArmaments.Fire,
        DecoratorSampleViewModelArmaments.Ice,
        DecoratorSampleViewModelArmaments.Thunder,
        DecoratorSampleViewModelArmaments.FireIce,
        DecoratorSampleViewModelArmaments.FireThunder,
        DecoratorSampleViewModelArmaments.IceThunder,
        DecoratorSampleViewModelArmaments.FireIceThunder
    ]
    
    internal var selectedArmament = DecoratorSampleViewModelArmaments.None {
        didSet {
            updateFighter()
            delegate?.selectedArmamentUpdated(self, selectedArmament: selectedArmament)
        }
    }
    
    init() {
        updateFighter()
    }
    
    // MARK: Private methods
    
    private func updateFighter() {
        
        var temporaryFighter: FightingMoves = StreetFighter()
        
        // TODO: Maybe we can simplify this using bitshift operator. Revisit it later.
        
        let shouldAddFireArmament = selectedArmament == .Fire || selectedArmament == .FireIce || selectedArmament == . FireThunder || selectedArmament == .FireIceThunder
        let shouldAddIceArmament = selectedArmament == .Ice || selectedArmament == .FireIce || selectedArmament == .IceThunder || selectedArmament == .FireIceThunder
        let shouldAddThunderArmament = selectedArmament == .Thunder || selectedArmament == .FireThunder || selectedArmament == .IceThunder || selectedArmament == .FireIceThunder
        
        if shouldAddFireArmament {
            temporaryFighter = FireFightingArmament(fighter: temporaryFighter)
        }
        
        if shouldAddIceArmament {
            temporaryFighter = IceFightingArmament(fighter: temporaryFighter)
        }
        
        if shouldAddThunderArmament {
            temporaryFighter = ThunderFightingArmament(fighter: temporaryFighter)
        }
        
        fighter = temporaryFighter
    }
    
    private func updateResultMove() {
        switch selectedFightingMove {
        case .Punch: resultMove = fighter.punch()
        case .Kick: resultMove = fighter.kick()
        }
    }
}