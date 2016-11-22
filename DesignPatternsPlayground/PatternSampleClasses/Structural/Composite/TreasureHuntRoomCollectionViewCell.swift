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
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth/2, height: screenWidth/2)
    }
    
    static func nib() -> UINib? {
        return UINib(nibName: "TreasureHuntRoomCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet fileprivate weak var roomNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Public method
    
    internal func configureForTreasureHuntRoom(_ room: TreasureHuntRoom) {
        roomNumberLabel.text = "Room #\(room.roomNumber)"
    }
    
    internal func setLabelColor(_ color: UIColor) {
        roomNumberLabel.textColor = color
    }
}
