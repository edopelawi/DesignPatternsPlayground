//
//  FlyweightSampleCollectionHeaderView.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/28/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FlyweightSampleCollectionHeaderView: UICollectionReusableView {

    static let identifier = "FlyweightSampleCollectionHeaderViewIdentifier"
    
    @IBOutlet private weak var duplicationMethodButton: UIButton!
    @IBOutlet private weak var numberPerTypeTextField: UITextField!
    
    
    @IBOutlet private var monsterButtons: [UIButton]!
    
    
    // MARK: Public methods
    
    /// Returns `UINib` instance for this class. Might be `nil`.
    static func nib() -> UINib? {
        return UINib(nibName: "FlyweightSampleCollectionHeaderView", bundle: nil)
    }
    
    /// Returns preferred `CGSize` to present this class' instance
    static func preferredSize() -> CGSize {
        let width = UIScreen.mainScreen().bounds.width
        let height = CGFloat(402)
        
        return CGSize(width: width, height: height)
    }
    
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
