//
//  CharacterSelectionViewModelFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/27/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation


final class CharacterSelectionViewModelFactory {
	
	static let availableEmojis: [String] = [
		"😀", "😎", "🤡", "🤠",
		"😈", "👺", "👻", "👽",
		"🤖", "👾", "🎃", "🦁",
		"🐻", "🐼", "🐨", "🐯"
	]
	
	static func create() -> CharacterSelectionViewModel {
		
		// TODO: Make a way to randomise the taken emojis fom the available emojis
		let takenEmojis = availableEmojis
		let characterViewModels: [CharacterViewModel] = takenEmojis.map { CharacterViewModel(emoji: $0, selected: false) }
		
		return CharacterSelectionViewModel(characterViewModels: characterViewModels)
	}
}
