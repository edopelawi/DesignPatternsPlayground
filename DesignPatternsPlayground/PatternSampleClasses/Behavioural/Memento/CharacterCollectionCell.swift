//
//  CharacterCollectionCell.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/27/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CharacterCollectionCell: UICollectionViewCell {
	
	static let identifier = "CharacterCollectionCell"
	
	@IBOutlet private weak var emojiLabel: UILabel?
	
	
	static func nib() -> UINib? {
		return UINib(nibName: "CharacterCollectionCell", bundle: nil)
	}
	
	func configure(viewModel: CharacterViewModel) {
		emojiLabel?.text = viewModel.emoji
		
		let backgroundColor: UIColor = viewModel.selected ? UIColor.blue : UIColor.white
		
		emojiLabel?.backgroundColor = backgroundColor
		self.contentView.backgroundColor = backgroundColor
	}	
}
