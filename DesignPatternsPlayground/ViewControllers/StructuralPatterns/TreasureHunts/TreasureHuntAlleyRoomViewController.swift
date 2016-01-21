//
//  TreasureHuntAlleyRoomViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntAlleyRoomViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var headerView: UICollectionReusableView!
    @IBOutlet weak var headerViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionView delegate and datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Update this later.
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // TODO: Update this later.
        return UICollectionViewCell()
    }

}
