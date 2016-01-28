//
//  FlyweightSampleCollectionHeaderView.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/28/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FlyweightSampleCollectionHeaderView: UICollectionReusableView {

    let identifier = "FlyweightSampleCollectionHeaderViewIdentifier"
    
    @IBOutlet private weak var duplicationMethodButton: UIButton!
    @IBOutlet private weak var numberPerTypeTextField: UITextField!
    
    
    @IBOutlet private var monsterButtons: [UIButton]!
    
    
    // TODO: Add method for configuring this according to view model.
    
    // MARK: IBActions
    
    @IBAction func monsterSelected(sender: UIButton) {
        
        sender.selected != sender.selected
        
        sender.backgroundColor = sender.selected ? UIColor.lightGrayColor() : UIColor.whiteColor()
        
        if sender.selected {
            // TODO: Add this monster type to view model
        } else {
            // TODO: Remove this monster type from view model
        }
        
    }
    
    @IBAction func startInvasion(sender: UIButton) {
        // TODO: Invoke view model's processing method here.
    }
}
