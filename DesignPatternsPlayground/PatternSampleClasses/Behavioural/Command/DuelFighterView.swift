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
	
	private var viewModel: DuelFighterViewModel?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	deinit {
		viewModel?.remove(observer: self)
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
	
	func configureFor(viewModel: DuelFighterViewModel) {
		
		self.viewModel = viewModel
		viewModel.add(observer: self)
		
		self.updateValuesFromViewModel()
	}
	
	fileprivate func updateValuesFromViewModel() {
		guard let viewModel = viewModel else {
			return
		}
		
		fighterNameLabel?.text = viewModel.name
		fighterEmojiLabel?.text = viewModel.emoji
		
		healthAmountLabel?.text = viewModel.health
		attackAmountLabel?.text = viewModel.attackPoint
		healAmountLabel?.text = viewModel.healPoint
	}
	
	@IBAction private func attackButtonTapped(_ sender: Any) {
		viewModel?.requestAttack()
	}
		
	@IBAction private func healButtonTapped(_ sender: Any) {
		viewModel?.requestHeal()
	}

}

extension DuelFighterView: DuelFighterViewModelObserver {
	
	func updated(duelFighterViewModel: DuelFighterViewModel) {
		updateValuesFromViewModel()
	}
}
