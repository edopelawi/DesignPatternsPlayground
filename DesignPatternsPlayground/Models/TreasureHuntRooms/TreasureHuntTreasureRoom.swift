//
//  TreasureHuntTreasureRoom.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class TreasureHuntTreasureRoom: TreasureHuntRoom {
    
    var roomNumber: Int
    
    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    func roomContentType() -> TreasureHuntRoomContentType {
        return .Treasure
    }
    
    /// Returns emoji presentation of the treasure that stored in this room.
    func roomContent() -> String {
        return "👑"
    }
}