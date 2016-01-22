//
//  DecoratorSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class DecoratorSampleViewController: UIViewController {

    @IBOutlet weak var fightingMoveButton: UIButton!
    @IBOutlet weak var armamentButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Street Fighter!"
    }
    
    @IBAction func showFightingMoveOptions(sender: UIButton) {
        // TODO: Show action sheet here.
    }

    @IBAction func showArmamentOptions(sender: UIButton) {
        // TODO: Show actino sheet here.
    }
}
