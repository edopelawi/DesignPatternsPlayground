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
    
    fileprivate var viewModel = FlyweightSampleViewModel()
    
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
        addCommentBarButton()
    }

    fileprivate func registerNibs() {
        collectionView?.register(
            FlyweightSampleCollectionHeaderView.nib(),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: FlyweightSampleCollectionHeaderView.identifier
        )
        
        collectionView?.register(
            FlyweightSampleCollectionViewCell.nib(),
            forCellWithReuseIdentifier: FlyweightSampleCollectionViewCell.identifier
        )
    }
    
    fileprivate func addCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(FlyweightSampleViewController.pushCommentsPage(_:)))
    }
    
    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .flyweight)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: FlyweightSampleCollectionHeaderView.identifier,
            for: indexPath
        ) as! FlyweightSampleCollectionHeaderView
        
        headerView.configureForViewModel(viewModel)
        headerView.delegate = self
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return FlyweightSampleCollectionHeaderView.preferredSize()
    }    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.monsterInvaders.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = FlyweightSampleCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FlyweightSampleCollectionViewCell
    
        let monster = viewModel.monsterInvaders[indexPath.row]
        let monsterNumber = "#\(indexPath.row)"
    
        cell.configureForIcon(monster.icon, numberString: monsterNumber)
        cell.sizeToFit()
        
        return cell
    }

    // MARK: FlyweightSampleCollectionHeaderViewDelegate 
    
    func headerView(_ headerView: FlyweightSampleCollectionHeaderView, shouldPresentAlertController: UIAlertController) {
        
        present(shouldPresentAlertController, animated: true, completion: nil)
    }
    
    // MARK: FlyweightSampleViewModelDelegate
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, duplicationMethodUpdated: FlyweightSampleDuplicationMethod) {
        
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, monsterInvadersStartUpdating: Void) {
        
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, monsterInvadersUpdated: [MonsterInvader]) {
        collectionView?.reloadData()
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, usedMemoryStringUpdated: String) {
        
    }
    
}
