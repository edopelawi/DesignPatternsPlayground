//
//  MementoSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/27/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class MementoSampleViewController: UIViewController {
	
	@IBOutlet fileprivate weak var selectedCharacterLabel: UILabel?
	@IBOutlet fileprivate weak var collectionView: UICollectionView?

	fileprivate var viewModel: CharacterSelectionViewModel? {
		didSet {
			configureForNewViewModel()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Character Selection!"
		viewModel = CharacterSelectionViewModelFactory.create()
		selectedCharacterLabel?.text = ""
		configureCollectionView()
		
    }
	
	@IBAction func saveButtonTapped(_ sender: Any) {
		
		// TODO: Add logic for this later.
	}
	
	@IBAction func loadButtonTapped(_ sender: Any) {
		// TODO: Add logic for this later.
	}
	
	private func configureCollectionView() {

		collectionView?.register(
			CharacterCollectionCell.nib(),
			forCellWithReuseIdentifier: CharacterCollectionCell.identifier
		)
	}
	
	private func configureForNewViewModel() {

		guard let viewModel = viewModel else {
			return
		}
		
		for character in viewModel.characterViewModels {
			
			if character.selected {
				selectedCharacterLabel?.text = character.emoji
				break
			}
		}
		
		collectionView?.reloadData()
	}
	
}

extension MementoSampleViewController: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		if let validCount = viewModel?.characterViewModels.count {
			return validCount
		} else {
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let identifier = CharacterCollectionCell.identifier
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
		
		guard let characterCell = cell as? CharacterCollectionCell,
			let viewModel = viewModel,
			indexPath.item < viewModel.characterViewModels.count else {
			return cell
		}
		
		
		let characterViewModel = viewModel.characterViewModels[indexPath.item]
		characterCell.configure(viewModel: characterViewModel)
		characterCell.sizeToFit()
		
		return characterCell
	}
	
}

extension MementoSampleViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let index = indexPath.item
		
		guard let viewModel = viewModel, index < viewModel.characterViewModels.count else {
			return
		}
		
		selectedCharacterLabel?.text = viewModel.characterViewModels[index].emoji
		
		viewModel.selectCharacter(withIndex: index)
		
		collectionView.reloadData()
	}
}
