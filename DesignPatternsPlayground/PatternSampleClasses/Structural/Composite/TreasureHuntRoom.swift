//
//  TreasureHuntRoom.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum TreasureHuntRoomContentType {
    case moreRooms
    case treasure
    case monster
}

protocol TreasureHuntRoom {
    
    var roomNumber: Int { get }
    
    /// Returns content type of this instance.
    func roomContentType() -> TreasureHuntRoomContentType
    
    /// Returns `String` representation of current content.
    func roomContent() -> String
}
