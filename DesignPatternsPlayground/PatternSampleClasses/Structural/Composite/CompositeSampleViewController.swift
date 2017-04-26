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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func enterEasyDungeon(_ sender: UIButton) {
        let depth = 3
        pushDungeonWithDepth(depth)
    }

    @IBAction func enterMediumDungeon(_ sender: UIButton) {
        let depth = 7
        pushDungeonWithDepth(depth)
    }
    
    @IBAction func enterHardDungeon(_ sender: UIButton) {
        let depth = 12
        pushDungeonWithDepth(depth)
    }
    
    // MARK: Private methods
    
    fileprivate func configureCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(CompositeSampleViewController.pushCommentsPage(_:)))
    }
    
    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .composite)
    }
    
    fileprivate func pushDungeonWithDepth(_ depth: Int) {
        let alleyRoom = TreasureHuntRoomFactory.treasureHuntRoomsWithDepth(depth) as! TreasureHuntAlleyRoom
        let viewController = TreasureHuntAlleyRoomViewController(alleyRoom: alleyRoom)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
