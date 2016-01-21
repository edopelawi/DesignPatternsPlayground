//
//  TreasureHuntAlleyRoom.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

/// Composite implementation of `TreasureHuntRoom`.
class TreasureHuntAlleyRoom: TreasureHuntRoom {
    
    var roomNumber: Int
    
    private var nextRooms: [ TreasureHuntRoom ] = []
    
    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    /// MARK: TreasureHuntRoom
    
    func roomContentType() -> TreasureHuntRoomContentType {
        return .MoreRooms
    }
    
    func roomContent() -> String {
        return "There are \(nextRooms) next room(s) available. Choose one."
    }
    
    /// MARK: Composite methods
    
    /// Returns number of next `TreasureHuntRoom`s that contained in this instance.
    internal func numberOfNextRooms() -> Int {
        return nextRooms.count
    }
    
    /// Retrieve this instance's  next `TreasureHuntRoom` on passed index. Will return
    /// nil for invalid index.
    internal func retrieveTreasureHuntRoomAtIndex(index: Int) -> TreasureHuntRoom? {
        if index < 0 || index >= nextRooms.count {
            return nil
        }
        
        return nextRooms[index]
    }
    
    /// Add passed `room` in list of next rooms
    internal func addTreasureHuntRoom(room: TreasureHuntRoom) {
        nextRooms.append(room)
    }
    
    /// Remove this instance's next room at passed `index`. Will do nothing
    /// if invalid index is passed.
    internal func removeTreasureHuntRoomAtIndex(index: Int) {
        if index < 0 || index >= nextRooms.count {
            return
        }
        
        nextRooms.removeAtIndex(index)
    }
    
}