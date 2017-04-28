//
//  DuelFighterCommand.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol DuelFighterCommand {
	
	var emoji: String { get }
	var description: String { get }
	
	var affectedFighter: DuelFighter { get }
	var initialFighterState: DuelFighter.Memento { get }
	
	/// Executes this command to the `affectedFighter`.
	func executeCommand()
}

extension DuelFighterCommand {
	
	/// Reverts the `affectedFighter` to the `initialFighterState`.
	func revertCommand() {
		affectedFighter.loadFrom(memento: initialFighterState)
	}
}

