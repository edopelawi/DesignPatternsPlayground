//
//  TreasureHuntTreasureRoomViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntTreasureRoomViewController: UIViewController {

    @IBOutlet weak var treasureLabel: UILabel!
    
    fileprivate var treasureRoom: TreasureHuntTreasureRoom?
    fileprivate var takeHomeActionClosure: ((Void) -> (Void))?
    
    init(treasureRoom: TreasureHuntTreasureRoom, takeHomeActionClosure: @escaping (Void) -> (Void)) {
        
        super.init(nibName: "TreasureHuntTreasureRoomViewController", bundle: nil)
        
        self.treasureRoom = treasureRoom
        self.takeHomeActionClosure = takeHomeActionClosure
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let room = treasureRoom {
            treasureLabel.text = room.roomContent()
        }
        
    }

    @IBAction func takeHomeAction(_ sender: UIButton) {
        if let validClosure = takeHomeActionClosure {
            validClosure()
        }
    }
}
