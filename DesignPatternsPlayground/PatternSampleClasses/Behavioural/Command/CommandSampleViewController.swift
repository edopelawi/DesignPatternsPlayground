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
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Alien vs Predator!"
		// TODO: Configure the duel fighter views here.
    }

}
