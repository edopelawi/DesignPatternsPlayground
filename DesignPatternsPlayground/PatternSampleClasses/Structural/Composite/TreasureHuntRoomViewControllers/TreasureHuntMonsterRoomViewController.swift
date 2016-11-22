//
//  TreasureHuntMonsterRoomViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntMonsterRoomViewController: UIViewController {

    @IBOutlet fileprivate weak var monsterLabel: UILabel!

    fileprivate var monsterRoom: TreasureHuntMonsterRoom?
    fileprivate var backButtonActionClosure: ((Void) -> (Void))?
    
    init(monsterRoom: TreasureHuntMonsterRoom, backButtonTappedClosure: @escaping (Void) -> (Void)) {
        super.init(nibName: "TreasureHuntMonsterRoomViewController", bundle: nil)
        
        self.monsterRoom = monsterRoom
        self.backButtonActionClosure = backButtonTappedClosure
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        if let validRoom = monsterRoom {
            monsterLabel.text = validRoom.roomContent()
        }
    }

    @IBAction func executeAction(_ sender: UIButton) {        
        if let validClosure = backButtonActionClosure {
            validClosure()
        }
    }
}
