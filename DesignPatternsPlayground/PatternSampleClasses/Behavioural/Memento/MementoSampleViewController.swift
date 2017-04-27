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
	@IBOutlet fileprivate weak var mementoPickerView: UIPickerView?
	@IBOutlet fileprivate weak var pickerWrapperView: UIView?
	
	fileprivate var viewModel: CharacterSelectionViewModel? {
		didSet {
			configureForNewViewModel()
		}
	}
	
	fileprivate let mementoManager = CharacterSelectionViewModel.MementoStorage.shared
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Character Selection!"
		viewModel = CharacterSelectionViewModelFactory.create()
		selectedCharacterLabel?.text = ""
		configureCollectionView()
		
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
	
	@IBAction func saveButtonTapped(_ sender: Any) {
		
		guard let viewModel = viewModel else {
			return
		}
		
		let memento = viewModel.createMemento()
		mementoManager.add(memento: memento)
	}
	
	@IBAction func loadButtonTapped(_ sender: Any) {
		
		mementoPickerView?.reloadAllComponents()
		pickerWrapperView?.isHidden = false
	}
	
	@IBAction func cancelMementoPick(_ sender: Any) {
		pickerWrapperView?.isHidden = true
	}
	
	@IBAction func selectMementoPick(_ sender: Any) {
		guard let selectedIndex = mementoPickerView?.selectedRow(inComponent: 0) else {
			return
		}
		
		let selectedMemento = mementoManager.mementos[selectedIndex]
		viewModel?.load(memento: selectedMemento)
		
		collectionView?.reloadData()
		pickerWrapperView?.isHidden = true
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

extension MementoSampleViewController: UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return mementoManager.mementos.count
	}
}

extension MementoSampleViewController: UIPickerViewDelegate {
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		
		guard component < mementoManager.mementos.count else {
			return nil
		}
		
		let memento = mementoManager.mementos[component]
		let dateFormatter = DateFormatter()
		
		return dateFormatter.stringForMementoSample(date: memento.date)
	}
	
}
