//
//  TreasureHuntRoomCollectionViewCell.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntRoomCollectionViewCell: UICollectionViewCell {

    static let identifier = "TreasureHuntRoomCollectionViewCellIdentifier"
    
    static func preferredSize() -> CGSize {
        let screenWidth = UIScreen.mainScreen().bounds.width
        return CGSizeMake(screenWidth/2, screenWidth/2)
    }
    
    @IBOutlet weak var roomNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Public method
    
    internal func configureForTreasureHuntRoom(room: TreasureHuntRoom) {
        // TODO: add configuration method here.
    }

}
