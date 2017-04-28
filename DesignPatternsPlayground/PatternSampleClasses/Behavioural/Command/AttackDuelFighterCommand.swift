//
//  AttackDuelFighterCommand.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct AttackDuelFighterCommand: DuelFighterCommand {
	
	let emoji: String
	let description: String
	
	let affectedFighter: DuelFighter
	let initialFighterState: DuelFighter.Memento
	
	private let attackPoint: Int
	
	init(attackPoint: Int, attackedFighter: DuelFighter) {
		
		self.attackPoint = attackPoint
		
		self.affectedFighter = attackedFighter
		self.initialFighterState = attackedFighter.createMemento()
		
		self.emoji = "💥\(attackedFighter.emoji)"
		self.description = "- \(attackPoint)"
	}
	
	func executeCommand() {
		affectedFighter.reduceHealth(byPoint: attackPoint)
	}	
}
