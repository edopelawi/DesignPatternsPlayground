//
//  CommandSampleViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class CommandSampleViewModel {
	
	let alienFighterViewModel: DuelFighterViewModel
	let predatorFighterViewModel: DuelFighterViewModel
	
	private let alienFighter: DuelFighter
	private let predatorFighter: DuelFighter
	
	private var storedCommands = [DuelFighterCommand]()
	
	init() {

		alienFighter = DuelFighter(
			name: "Alien",
			emoji: "👽",
			attackPoint: 10,
			healPoint: 5
		)
		
		predatorFighter = DuelFighter(
			name: "Predator",
			emoji: "🐲",
			attackPoint: 11,
			healPoint: 4
		)
		
		alienFighterViewModel = DuelFighterViewModel(fighter: alienFighter)
		predatorFighterViewModel = DuelFighterViewModel(fighter: predatorFighter)
		
		configureViewModelHandlers()
	}
	
	private func configureViewModelHandlers() {
	
		
		alienFighterViewModel.onAttackRequested = { [weak self] fighter in
			
			guard let `self` = self else {
				return
			}
			
			let attackCommand = AttackDuelFighterCommand(
				attackPoint: fighter.attackPoint,
				attackedFighter: self.predatorFighter
			)
			
			attackCommand.executeCommand()
			self.storedCommands.append(attackCommand)
		}
		
		alienFighterViewModel.onHealRequested = { [weak self] fighter in
			
			guard let `self` = self else {
				return
			}
			
			let healCommand = HealDuelFighterCommand(healedFighter: fighter)
			healCommand.executeCommand()
			
			self.storedCommands.append(healCommand)
		}
		
		
		predatorFighterViewModel.onAttackRequested = { [weak self] fighter in
			
			guard let `self` = self else {
				return
			}
			
			let attackCommand = AttackDuelFighterCommand(
				attackPoint: fighter.attackPoint,
				attackedFighter: self.alienFighter
			)
			
			attackCommand.executeCommand()
			self.storedCommands.append(attackCommand)
		}
		
		predatorFighterViewModel.onHealRequested = { [weak self] fighter in
			
			guard let `self` = self else {
				return
			}
			
			let healCommand = HealDuelFighterCommand(healedFighter: fighter)
			healCommand.executeCommand()
			
			self.storedCommands.append(healCommand)
		}
	}
}
