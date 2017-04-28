//
//  CommandSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 4/28/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CommandSampleViewController: UIViewController {

	@IBOutlet private weak var leftFighterView: DuelFighterView?
	@IBOutlet private weak var rightFighterView: DuelFighterView?
	
	private let viewModel = CommandSampleViewModel()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Alien vs Predator!"
		
		leftFighterView?.configureFor(viewModel: viewModel.alienFighterViewModel)
		rightFighterView?.configureFor(viewModel: viewModel.predatorFighterViewModel)
    }

	@IBAction func undoLatestCommand(_ sender: Any) {
		viewModel.revertLatestCommand()
	}
	
}
