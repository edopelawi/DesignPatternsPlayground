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
    
    @IBOutlet fileprivate weak var iconLabel: UILabel!
    @IBOutlet fileprivate weak var numberLabel: UILabel!
    
    fileprivate var iconBuffer: String?
    fileprivate var numberBuffer: String?
    
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
        return CGSize(width: 40, height: 70)
    }
    
    internal func configureForIcon(_ icon: String, numberString: String) {

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
