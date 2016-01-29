//
//  FlyweightSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/28/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FlyweightSampleViewController: UICollectionViewController, FlyweightSampleCollectionHeaderViewDelegate, FlyweightSampleViewModelDelegate {
    
    private var viewModel = FlyweightSampleViewModel()
    
    convenience init() {
        self.init(nibName:"FlyweightSampleViewController", bundle:nil)
    }
    
    deinit {
        viewModel.removeDelegate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Monster Invasion!"
        registerNibs()
        viewModel.addDelegate(self)
    }

    private func registerNibs() {
        collectionView?.registerNib(
            FlyweightSampleCollectionHeaderView.nib(),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: FlyweightSampleCollectionHeaderView.identifier
        )
        
        collectionView?.registerNib(
            FlyweightSampleCollectionViewCell.nib(),
            forCellWithReuseIdentifier: FlyweightSampleCollectionViewCell.identifier
        )
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(
            UICollectionElementKindSectionHeader,
            withReuseIdentifier: FlyweightSampleCollectionHeaderView.identifier,
            forIndexPath: indexPath
        ) as! FlyweightSampleCollectionHeaderView
        
        headerView.configureForViewModel(viewModel)
        headerView.delegate = self
        return headerView
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return FlyweightSampleCollectionHeaderView.preferredSize()
    }    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.monsterInvaders.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let identifier = FlyweightSampleCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! FlyweightSampleCollectionViewCell
    
        let monster = viewModel.monsterInvaders[indexPath.row]
        let monsterNumber = "#\(indexPath.row)"
    
        cell.configureForIcon(monster.icon, numberString: monsterNumber)
        cell.sizeToFit()
        
        return cell
    }

    // MARK: FlyweightSampleCollectionHeaderViewDelegate 
    
    func headerView(headerView: FlyweightSampleCollectionHeaderView, shouldPresentAlertController: UIAlertController) {
        
        presentViewController(shouldPresentAlertController, animated: true, completion: nil)
    }
    
    // MARK: FlyweightSampleViewModelDelegate
    
    func viewModel(viewModel: FlyweightSampleViewModel, duplicationMethodUpdated: FlyweightSampleDuplicationMethod) {
        
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersStartUpdating: Void) {
        
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersUpdated: [MonsterInvader]) {
        collectionView?.reloadData()
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, usedMemoryStringUpdated: String) {
        
    }
    
}
