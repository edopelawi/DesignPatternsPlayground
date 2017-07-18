//
//  DuelFighterViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol DuelFighterViewModelObserver: class {
	
	func updated(duelFighterViewModel: DuelFighterViewModel)
}

class DuelFighterViewModel {
	
	private let fighter: DuelFighter
	fileprivate var observers = [DuelFighterViewModelObserver]()
	
	var onAttackRequested: ((DuelFighter) -> Void)?
	var onHealRequested: ((DuelFighter) -> Void)?
	
	var name: String {
		return fighter.name
	}
	
	var emoji: String {
		return fighter.emoji
	}
	
	var health: String {
		return "\(fighter.health)"
	}
	
	var attackPoint: String {
		return "\(fighter.attackPoint)"
	}
	
	var healPoint: String {
		return "\(fighter.healPoint)"
	}
	
	init(fighter: DuelFighter) {
		self.fighter = fighter
		self.fighter.add(observer: self)
	}
	
	deinit {
		self.fighter.remove(observer: self)
	}
	
	// MARK: - Command-related methods
	
	func requestAttack() {
		onAttackRequested?(fighter)
	}
	
	func requestHeal() {
		onHealRequested?(fighter)
	}
	
	// MARK: - Observer-related methods
	
	func add(observer: DuelFighterViewModelObserver) {
	
		if let _ = indexFor(observer: observer) {
			return
		} else {
			observers.append(observer)
		}
	}
	
	func remove(observer: DuelFighterViewModelObserver) {
	
		guard let validIndex = indexFor(observer: observer) else {
			return
		}
		
		observers.remove(at: validIndex)
	}
	
	private func indexFor(observer: DuelFighterViewModelObserver) -> Int? {
		
		return observers.index(where: { currentObserver -> Bool in
			return observer === currentObserver
		})
	}
}

extension DuelFighterViewModel: DuelFighterObserver {

	func healthUpdated(duelFighter: DuelFighter) {
		observers.forEach { $0.updated(duelFighterViewModel: self) }
	}
}
