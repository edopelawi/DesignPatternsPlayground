//
//  CharacterSelectionViewModel.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/27/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class CharacterSelectionViewModel {
	
	struct Memento {
		
		let date: Date
		
		fileprivate let childMementos: [CharacterViewModel]
		
		fileprivate init(date: Date, childMementos: [CharacterViewModel]) {
			self.date = date
			self.childMementos = childMementos
		}
	}
	
	fileprivate(set) var characterViewModels: [CharacterViewModel]
	
	init(characterViewModels: [CharacterViewModel] = []) {
		self.characterViewModels = characterViewModels
	}
	
	func selectCharacter(withIndex index: Int) {

		guard index < characterViewModels.count else {
			return
		}
		
		characterViewModels = characterViewModels.map { viewModel -> CharacterViewModel in
			return CharacterViewModel(emoji: viewModel.emoji, selected: false)
		}
		
		characterViewModels[index].selected = true
	}
	
	// MARK: - Memento-related methods
	
	func createMemento() -> Memento {
		return Memento(
			date: Date(),
			childMementos: self.characterViewModels
		)
	}
	
	func load(memento: Memento) {
		self.characterViewModels = memento.childMementos
	}
}

// MARK: - Memento-related extensions

extension CharacterViewModel {
	
	fileprivate func toDictionary() -> [String: Any] {
		return [
			"emoji": self.emoji,
			"selected": self.selected
		]
	}
	
	fileprivate init?(fromDictionary dictionary: [String: Any]) {
		
		guard let emoji = dictionary["emoji"] as? String,
			let selected = dictionary["selected"] as? Bool else {
				return nil
		}
		
		self.init(emoji: emoji, selected: selected)
	}
}

extension CharacterSelectionViewModel.Memento {
	
	fileprivate func toDictionary() -> [String: Any] {
		
		let dateFormatter = DateFormatter()
		
		let rawDate = dateFormatter.stringForMementoSample(date: self.date)
		let rawChilds = self.childMementos.map { $0.toDictionary() }
		
		return [
			"date": rawDate,
			"childs": rawChilds
		]
	}
	
	fileprivate init?(fromDictionary dictionary: [String: Any]) {
		
		let dateFormatter = DateFormatter()
		
		guard let rawDate = dictionary["date"] as? String,
			let rawChilds = dictionary["childs"] as? [[String: Any]],
			let date = dateFormatter.dateForMementoSample(string: rawDate) else {
				return nil
		}
		
		let childs = rawChilds.flatMap { (rawChild: [String: Any]) -> CharacterViewModel? in			
			return CharacterViewModel(fromDictionary: rawChild)
		}
		
		self.init(date: date, childMementos: childs)
	}
	
}


extension CharacterSelectionViewModel {
	
	final class MementoStorage {
		
		static let shared = MementoStorage()
		
		let userDefaults: UserDefaults
		var mementos = [Memento]()
		
		private let mementoKey = "CharacterMementoKey"
		
		private typealias RawMemento = [String: Any]
		
		private init(userDefaults: UserDefaults = UserDefaults.standard) {
			self.userDefaults = userDefaults
			loadInitialMementos()
		}
		
		private func loadInitialMementos() {
			
			guard let rawMementos = userDefaults.array(forKey:mementoKey) as? [RawMemento] else {
				return
			}
			
			mementos = rawMementos.flatMap { Memento(fromDictionary: $0) }
		}
		
		func add(memento: Memento) {
			mementos.append(memento)
			
			let rawMemento = mementos.map { $0.toDictionary() }
			userDefaults.set(rawMemento, forKey: mementoKey)
		}
	}
}

