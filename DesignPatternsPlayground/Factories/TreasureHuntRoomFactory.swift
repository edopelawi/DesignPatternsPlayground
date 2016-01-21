//
//  TreasureHuntRoomFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class TreasureHuntRoomFactory {
    
    
    /// Returns TreasureHuntRoom instance with passed `depth`. Will directly 
    /// return a TreasureHuntTreasureRoom if depth is less or equal to `1`,
    /// and `TreasureHuntAlleyRoom` other wise.
    ///
    /// - note: Returned `TreasureHuntAlleyRoom` will have a `TreasureHuntTreasureRoom` on maximum depth. On other level of depth, there will be only a single `TreasureHuntAlleyRoom`. Others will be `TreasureHuntMonsterRoom`.
    
    static func treasureHuntRoomsWithDepth(depth: Int) -> TreasureHuntRoom {
        
        if depth <= 1 {
            return TreasureHuntTreasureRoom(roomNumber: 1)
        }

        let firstAlleyRoom = TreasureHuntAlleyRoom(roomNumber: 1)
        var processedAlleyRoom = firstAlleyRoom
        
        for index in 1...depth {
            
            let lastDepth = index == depth
            let numberOfRooms = (random() % 5) + 2
            
            populateAlleyRoom(
                processedAlleyRoom,
                numberOfRooms: numberOfRooms,
                containsTreasureRoom: lastDepth
            )
            
            if lastDepth {
                break
            }
            
            for populatedRoomIndex in 0...numberOfRooms-1 {

                let populatedRoom = processedAlleyRoom.retrieveTreasureHuntRoomAtIndex(populatedRoomIndex)
                
                if populatedRoom?.roomContentType() == .MoreRooms {
                    processedAlleyRoom = populatedRoom as! TreasureHuntAlleyRoom
                    break
                }
            }
        }
    
        return firstAlleyRoom
    }
    
    /// Populates passed `room` with a single `TreasureHuntAlleyRoom` and `TreasureHuntMonsterRoom`s.
    /// The alley room will be replaced with `TreasureHuntTreasureRoom` if `containsTreasureRoom` is true.
    
    static private func populateAlleyRoom(room: TreasureHuntAlleyRoom, numberOfRooms: Int, containsTreasureRoom: Bool) {
        
        var specialRoomAdded = false
        let baseRoomNumber = (room.roomNumber * 10)
        
        for index in 0...numberOfRooms-1 {

            var newRoom: TreasureHuntRoom
            let newRoomNumber = baseRoomNumber + index
            
            let shouldAddMonsterRoom = (random() % 4) > 0
            let lastRoom = index == numberOfRooms-1
            
            switch (shouldAddMonsterRoom, specialRoomAdded, lastRoom) {
                
            case (false, false, _): fallthrough
            case (_, false, true):
                
                newRoom = containsTreasureRoom ? TreasureHuntTreasureRoom(roomNumber: newRoomNumber) : TreasureHuntAlleyRoom(roomNumber: newRoomNumber)
                specialRoomAdded = true
                
            default: newRoom = TreasureHuntMonsterRoom(roomNumber: newRoomNumber)
            }
            
            room.addTreasureHuntRoom(newRoom)
        }
    }
}