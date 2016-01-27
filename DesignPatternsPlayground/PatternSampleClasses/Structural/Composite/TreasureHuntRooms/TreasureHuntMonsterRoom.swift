//
//  TreasureHuntMonsterRoom.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class TreasureHuntMonsterRoom: TreasureHuntRoom {
    
    var roomNumber: Int
    
    private let possibleMonsters = [
        "👻", "👹", "👺",
        "💀", "👽", "👾",
        "🐲"
    ]
    
    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    func roomContentType() -> TreasureHuntRoomContentType {
        return .Monster
    }
    
    /// Returns emoji representation of current monster in the room.
    func roomContent() -> String {
        if let monster = possibleMonsters.randomElement() {
            return monster
        } else {
            return ""
        }
    }
}