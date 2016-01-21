//
//  CompositeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CompositeSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dungeon of Treasures!"
        configureCommentBarButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
    }

    @IBAction func enterEasyDungeon(sender: UIButton) {
        let depth = 3
        pushDungeonWithDepth(depth)
    }

    @IBAction func enterMediumDungeon(sender: UIButton) {
        let depth = 7
        pushDungeonWithDepth(depth)
    }
    
    @IBAction func enterHardDungeon(sender: UIButton) {
        let depth = 12
        pushDungeonWithDepth(depth)
    }
    
    // MARK: Private methods
    
    private func configureCommentBarButton() {
        addCommentsRightBarButton(target: self, action: Selector("pushCommentsPage:"))
    }
    
    @objc private func pushCommentsPage(sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .Composite)
    }
    
    private func pushDungeonWithDepth(depth: Int) {
        let alleyRoom = TreasureHuntRoomFactory.treasureHuntRoomsWithDepth(depth) as! TreasureHuntAlleyRoom
        let viewController = TreasureHuntAlleyRoomViewController(alleyRoom: alleyRoom)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
