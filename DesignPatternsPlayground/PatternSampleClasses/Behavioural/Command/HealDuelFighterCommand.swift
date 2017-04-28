//
//  HealDuelFighterCommand.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct HealDuelFighterCommand: DuelFighterCommand {
	
	let emoji: String
	let description: String
	
	let affectedFighter: DuelFighter
	let initialFighterState: DuelFighter.Memento
	
	init(healedFighter: DuelFighter) {

		self.affectedFighter = healedFighter
		self.initialFighterState = healedFighter.createMemento()
		
		self.emoji = "💊\(healedFighter.emoji)"
		self.description = "+\(healedFighter.healPoint)"
	}
	
	func executeCommand() {
		affectedFighter.healSelf()
	}
}
