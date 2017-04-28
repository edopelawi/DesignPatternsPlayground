//
//  DuelFighterView.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class DuelFighterView: UIView {

	@IBOutlet private var contentView: UIView?
	
	@IBOutlet private weak var fighterNameLabel: UILabel?
	@IBOutlet private weak var fighterEmojiLabel: UILabel?
	
	@IBOutlet private weak var healthAmountLabel: UILabel?
	@IBOutlet private weak var attackAmountLabel: UILabel?
	@IBOutlet private weak var healAmountLabel: UILabel?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		let bundle = Bundle.main
		let _ = bundle.loadNibNamed("DuelFighterView", owner: self, options: nil)
		
		guard let contentView = contentView else {
			return
		}
		
		contentView.frame = self.bounds
		contentView.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
		
		self.addSubview(contentView)
	}
	
	@IBAction private func attackButtonTapped(_ sender: Any) {
		
	}
		
	@IBAction private func healButtonTapped(_ sender: Any) {
		
	}
	
	// TODO: Add method to listen from ViewModel later.
	

}
