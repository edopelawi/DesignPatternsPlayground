//
//  TreasureHuntAlleyRoomViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntAlleyRoomViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var alleyRoom: TreasureHuntAlleyRoom?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var headerView: UICollectionReusableView!
    @IBOutlet weak var headerViewLabel: UILabel!
    
    init(alleyRoom: TreasureHuntAlleyRoom) {
        super.init(nibName: "TreasureHuntAlleyRoomViewController", bundle: nil)
        self.alleyRoom = alleyRoom
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        registerHeaderView()
    }
    
    // MARK: Private methods
    
    private func registerCells() {
        let cellNib = TreasureHuntRoomCollectionViewCell.nib()
        let cellIdentifier = TreasureHuntRoomCollectionViewCell.identifier
        
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func registerHeaderView() {
        // TODO: Implement this method later.
    }
    
    // MARK: UICollectionView delegate and datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let validRoom = alleyRoom {
            return validRoom.numberOfNextRooms()
        } else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return TreasureHuntRoomCollectionViewCell.preferredSize()
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // TODO: Update this later.
        
        let identifier = TreasureHuntRoomCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! TreasureHuntRoomCollectionViewCell        
        
        let index = indexPath.row
        
        if let nextRoom = alleyRoom?.retrieveTreasureHuntRoomAtIndex(index) {
            cell.configureForTreasureHuntRoom(nextRoom)
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // TODO: Push corresponding page later.
    }
    

}
