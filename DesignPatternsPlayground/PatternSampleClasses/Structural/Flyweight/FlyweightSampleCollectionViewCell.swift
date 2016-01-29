//
//  FlyweightSampleCollectionViewCell.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FlyweightSampleCollectionViewCell: UICollectionViewCell {

    static let identifier = "FlyweightSampleCollectionViewCellIdentifier"
    
    @IBOutlet private weak var iconLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    
    private var iconBuffer: String?
    private var numberBuffer: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let bufferedIcon = iconBuffer {
            iconLabel.text = bufferedIcon
        }
        
        if let bufferedNumber = numberBuffer {
            iconLabel.text = bufferedNumber
        }
    }

    
    // MARK: Public methods
    
    static func nib() -> UINib? {
        return UINib(nibName: "FlyweightSampleCollectionViewCell", bundle: nil)
    }
    
    static func preferredSize() -> CGSize {
        return CGSizeMake(40, 70)
    }
    
    internal func configureForIcon(icon: String, numberString: String) {

        if iconLabel == nil {
            iconBuffer = icon
        } else {
            iconLabel.text = icon
        }
        
        if numberLabel == nil {
            numberBuffer = numberString
        } else {
            numberLabel.text = numberString
        }
        
    }
}
