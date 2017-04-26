//
//  FlyweightSampleCollectionHeaderView.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/28/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

protocol FlyweightSampleCollectionHeaderViewDelegate: class {
    
    /// Called when `headerView` needs to present a `UIAlertController`.
    func headerView(_ headerView: FlyweightSampleCollectionHeaderView, shouldPresentAlertController: UIAlertController)
    
}

class FlyweightSampleCollectionHeaderView: UICollectionReusableView, FlyweightSampleViewModelDelegate {

    static let identifier = "FlyweightSampleCollectionHeaderViewIdentifier"
    
    weak internal var delegate: FlyweightSampleCollectionHeaderViewDelegate?
    
    @IBOutlet fileprivate weak var duplicationMethodButton: UIButton!
    @IBOutlet fileprivate weak var numberPerTypeTextField: UITextField!
    
    @IBOutlet fileprivate weak var usedMemoryLabel: UILabel!
    
    @IBOutlet fileprivate var monsterButtons: [UIButton]!
    
    fileprivate var viewModel: FlyweightSampleViewModel?
    
    // MARK: Public methods
    
    /// Returns `UINib` instance for this class. Might be `nil`.
    static func nib() -> UINib? {
        return UINib(nibName: "FlyweightSampleCollectionHeaderView", bundle: nil)
    }
    
    /// Returns preferred `CGSize` to present this class' instance
    static func preferredSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = CGFloat(402)
        
        return CGSize(width: width, height: height)
    }    
    
    internal func configureForViewModel(_ viewModel: FlyweightSampleViewModel) {
        
        if self.viewModel === viewModel {
            return
        }
        
        if let oldViewModel = self.viewModel {
            oldViewModel.removeDelegate(self)
        }
        
        self.viewModel = viewModel
        self.viewModel?.addDelegate(self)
    }
    
    // MARK: FlyweightSampleViewModel delegate methods
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, monsterInvadersStartUpdating: Void) {
        usedMemoryLabel.text = "Generating..."
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, duplicationMethodUpdated: FlyweightSampleDuplicationMethod) {
        
        duplicationMethodButton.setTitle(duplicationMethodUpdated.rawValue, for: UIControlState())
        duplicationMethodButton.setTitle(duplicationMethodUpdated.rawValue, for: .highlighted)
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, usedMemoryStringUpdated: String) {
        
        usedMemoryLabel.text = usedMemoryStringUpdated
    }
    
    func viewModel(_ viewModel: FlyweightSampleViewModel, monsterInvadersUpdated: [MonsterInvader]) {
        
    }
    
    // MARK: IBActions
    
    @IBAction func showDuplicationMethodOptions(_ sender: UIButton) {
        guard let validViewModel = self.viewModel else {
            return
        }
        
        let alertController = UIAlertController(
            title: "Duplication methods",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        for option in validViewModel.duplicationMethodOptions {

            let action = UIAlertAction(
                title: option.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel?.selectedDuplicationMethod = option
            })
            
            alertController.addAction(action)
        }
        
        delegate?.headerView(self, shouldPresentAlertController: alertController)
    }
    
    @IBAction func numberTypeFieldUpdated(_ sender: UITextField) {
        
        if let validString = sender.text,
           let validNumber = Int(validString) {
                viewModel?.numberPerType = validNumber
        }        
    }
    
    
    @IBAction func monsterSelected(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        sender.backgroundColor = sender.isSelected ? UIColor.lightGray : UIColor.white
        
        guard let monsterIcon = sender.titleLabel?.text else {
            return
        }
        
        if sender.isSelected {
            viewModel?.addMonsterIcon(monsterIcon)
        } else {
            viewModel?.removeMonsterIcon(monsterIcon)
        }
        
    }
    
    @IBAction func startInvasion(_ sender: UIButton) {
        viewModel?.startInvasion()
    }
}
