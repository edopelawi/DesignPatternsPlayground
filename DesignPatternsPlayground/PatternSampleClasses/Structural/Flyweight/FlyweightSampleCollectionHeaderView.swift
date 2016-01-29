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
    func headerView(headerView: FlyweightSampleCollectionHeaderView, shouldPresentAlertController: UIAlertController)
    
}

class FlyweightSampleCollectionHeaderView: UICollectionReusableView, FlyweightSampleViewModelDelegate {

    static let identifier = "FlyweightSampleCollectionHeaderViewIdentifier"
    
    weak internal var delegate: FlyweightSampleCollectionHeaderViewDelegate?
    
    @IBOutlet private weak var duplicationMethodButton: UIButton!
    @IBOutlet private weak var numberPerTypeTextField: UITextField!
    
    @IBOutlet private weak var usedMemoryLabel: UILabel!
    
    @IBOutlet private var monsterButtons: [UIButton]!
    
    private var viewModel: FlyweightSampleViewModel?
    
    // MARK: Public methods
    
    /// Returns `UINib` instance for this class. Might be `nil`.
    static func nib() -> UINib? {
        return UINib(nibName: "FlyweightSampleCollectionHeaderView", bundle: nil)
    }
    
    /// Returns preferred `CGSize` to present this class' instance
    static func preferredSize() -> CGSize {
        let width = UIScreen.mainScreen().bounds.width
        let height = CGFloat(402)
        
        return CGSize(width: width, height: height)
    }    
    
    internal func configureForViewModel(viewModel: FlyweightSampleViewModel) {
        
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
    
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersStartUpdating: Void) {
        usedMemoryLabel.text = "Generating..."
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, duplicationMethodUpdated: FlyweightSampleDuplicationMethod) {
        
        duplicationMethodButton.setTitle(duplicationMethodUpdated.rawValue, forState: .Normal)
        duplicationMethodButton.setTitle(duplicationMethodUpdated.rawValue, forState: .Highlighted)
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, usedMemoryStringUpdated: String) {
        
        usedMemoryLabel.text = usedMemoryStringUpdated
    }
    
    func viewModel(viewModel: FlyweightSampleViewModel, monsterInvadersUpdated: [MonsterInvader]) {
        
    }
    
    // MARK: IBActions
    
    @IBAction func showDuplicationMethodOptions(sender: UIButton) {
        guard let validViewModel = self.viewModel else {
            return
        }
        
        let alertController = UIAlertController(
            title: "Duplication methods",
            message: nil,
            preferredStyle: .ActionSheet
        )
        
        for option in validViewModel.duplicationMethodOptions {

            let action = UIAlertAction(
                title: option.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel?.selectedDuplicationMethod = option
            })
            
            alertController.addAction(action)
        }
        
        delegate?.headerView(self, shouldPresentAlertController: alertController)
    }
    
    @IBAction func numberTypeFieldUpdated(sender: UITextField) {
        
        if let validString = sender.text,
           let validNumber = Int(validString) {
                viewModel?.numberPerType = validNumber
        }        
    }
    
    
    @IBAction func monsterSelected(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        sender.backgroundColor = sender.selected ? UIColor.lightGrayColor() : UIColor.whiteColor()
        
        guard let monsterIcon = sender.titleLabel?.text else {
            return
        }
        
        if sender.selected {
            viewModel?.addMonsterIcon(monsterIcon)
        } else {
            viewModel?.removeMonsterIcon(monsterIcon)
        }
        
    }
    
    @IBAction func startInvasion(sender: UIButton) {
        viewModel?.startInvasion()
    }
}
