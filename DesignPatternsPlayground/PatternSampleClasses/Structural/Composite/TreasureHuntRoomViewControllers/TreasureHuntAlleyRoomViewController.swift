//
//  TreasureHuntAlleyRoomViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/21/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TreasureHuntAlleyRoomViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate var alleyRoom: TreasureHuntAlleyRoom?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
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
        
        if let validRoom = alleyRoom {
            headerLabel.text = "Room #\(validRoom.roomNumber). Choose your door wisely."
        }
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: Private methods
    
    fileprivate func registerCells() {
        let cellNib = TreasureHuntRoomCollectionViewCell.nib()
        let cellIdentifier = TreasureHuntRoomCollectionViewCell.identifier
        
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    // MARK: UICollectionView delegate and datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let validRoom = alleyRoom {
            return validRoom.numberOfNextRooms()
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
            return TreasureHuntRoomCollectionViewCell.preferredSize()
    }
    
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Update this later.
        
        let identifier = TreasureHuntRoomCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TreasureHuntRoomCollectionViewCell
        
        cell.setLabelColor(UIColor.white)
        let index = indexPath.row
        
        if let nextRoom = alleyRoom?.retrieveTreasureHuntRoomAtIndex(index) {
            cell.configureForTreasureHuntRoom(nextRoom)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let index = indexPath.row
        
        guard let nextRoom = alleyRoom?.retrieveTreasureHuntRoomAtIndex(index) else {
            return
        }
        
        var nextViewController: UIViewController
        
        switch nextRoom.roomContentType() {
        
        case .moreRooms: nextViewController = TreasureHuntAlleyRoomViewController(alleyRoom: nextRoom as! TreasureHuntAlleyRoom)
            
        case .monster:
            nextViewController = TreasureHuntMonsterRoomViewController(
                monsterRoom: nextRoom as! TreasureHuntMonsterRoom,
                backButtonTappedClosure: {
                    [weak self] in
                    
                    guard let strongSelf = self else {
                        return
                    }
                    
                    let _ = strongSelf.navigationController?.popToViewController(strongSelf, animated: true)
                    
            })
            
        case .treasure:
            nextViewController = TreasureHuntTreasureRoomViewController(
                treasureRoom: nextRoom as! TreasureHuntTreasureRoom,
                takeHomeActionClosure: {
                    [weak self] in
                    
                    guard let strongSelf = self else {
                        return
                    }
                    
                    guard let viewControllers = strongSelf.navigationController?.viewControllers else {
                        return
                    }
                    
                    for viewController in viewControllers {
                        
                        if let firstPage = viewController as? CompositeSampleViewController {
                            let _ = strongSelf.navigationController?.popToViewController(firstPage, animated: true)
                            break
                        }
                    }                    
            })
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    

}
