//
//  DuelFighter.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol DuelFighterObserver: class {
	func healthUpdated(duelFighter: DuelFighter)
}

class DuelFighter {
	
	struct Memento {
		fileprivate let health: Int
		
		fileprivate init(health: Int) {
			self.health = health
		}
	}
	
	let name: String
	let emoji: String
	
	let attackPoint: Int
	let healPoint: Int
	
	private(set) var health: Int {
		didSet {
			
			let belowMinimum = health < 0
			let overMaximum = health > 100
			
			if belowMinimum {
				health = 0
			} else if overMaximum {
				health = 100
			}
			
			observers.forEach { $0.healthUpdated(duelFighter: self) }
		}
	}
	
	private var observers = [DuelFighterObserver]()
	
	init(name: String, emoji: String, attackPoint: Int, healPoint: Int) {
		self.name = name
		self.emoji = emoji
		self.attackPoint = attackPoint
		self.healPoint = healPoint
		
		self.health = 100
	}
	
	// MARK: - Public methods
	
	func reduceHealth(byPoint point: Int) {
		health -= point
	}
	
	func healSelf() {
		health += healPoint
	}
	
	// MARK: - Observer-related methods
	
	func add(observer: DuelFighterObserver) {
		
		if let _ = indexFor(observer: observer) {
			return
		} else {
			self.observers.append(observer)
		}
		
	}
	
	func remove(observer: DuelFighterObserver) {
		
		guard let validIndex = indexFor(observer: observer) else {
			return
		}
		
		observers.remove(at: validIndex)
	}
	
	private func indexFor(observer: DuelFighterObserver) -> Int? {
		return observers.index { currentObserver -> Bool in
			return currentObserver === observer
		}
	}
	// MARK: - Memento-related methods
	
	func createMemento() -> Memento {
		return Memento(health: self.health)
	}
	
	func loadFrom(memento: Memento) {
		self.health = memento.health
	}
}
