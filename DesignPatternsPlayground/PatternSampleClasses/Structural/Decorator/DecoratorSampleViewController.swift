//
//  DecoratorSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class DecoratorSampleViewController: UIViewController, DecoratorSampleViewModelDelegate {

    @IBOutlet private weak var fightingMoveButton: UIButton!
    @IBOutlet private weak var armamentButton: UIButton!
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var viewModel = DecoratorSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Street Fighter!"
        viewModel.delegate = self
        loadInitialViewModelValue()
        addCommentBarButton()
    }
    
    @IBAction func showFightingMoveOptions(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Fighting Moves", message: "", preferredStyle: .ActionSheet)
        
        for fightingMove in viewModel.fightingMoveOptions {
            
            let action = UIAlertAction(
                title: fightingMove.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedFightingMove = fightingMove
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }

    @IBAction func showArmamentOptions(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Fighting Armaments", message: "", preferredStyle: .ActionSheet)
        
        for armament in viewModel.armamentOptions {
            
            let action = UIAlertAction(
                title: armament.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedArmament = armament
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: DecoratorSampleViewModelDelegate
    
    func selectedArmamentUpdated(viewModel: DecoratorSampleViewModel, selectedArmament: DecoratorSampleViewModelArmaments) {
        armamentButton.setTitle(selectedArmament.rawValue, forState: .Normal)
        armamentButton.setTitle(selectedArmament.rawValue, forState: .Highlighted)
    }
    
    func selectedFightingMoveUpdated(viewModel: DecoratorSampleViewModel, selectedFightingMove: DecoratorSampleViewModelMoves) {
        fightingMoveButton.setTitle(selectedFightingMove.rawValue, forState: .Normal)
        fightingMoveButton.setTitle(selectedFightingMove.rawValue, forState: .Highlighted)
    }
    
    func resultMoveUpdated(viewModel: DecoratorSampleViewModel, resultMove: String) {
        resultLabel.text = resultMove
    }
    
    // MARK: Private methods
    
    private func loadInitialViewModelValue() {
        let selectedArmamentString = viewModel.selectedArmament.rawValue
        armamentButton.setTitle(selectedArmamentString, forState: .Normal)
        armamentButton.setTitle(selectedArmamentString, forState: .Highlighted)
        
        let selectedMoveString = viewModel.selectedFightingMove.rawValue
        fightingMoveButton.setTitle(selectedMoveString, forState: .Normal)
        fightingMoveButton.setTitle(selectedMoveString, forState: .Highlighted)
        
        resultLabel.text = viewModel.resultMove
    }
    
    private func addCommentBarButton() {
        addCommentsRightBarButton(target: self, action: Selector("pushCommentPage:"))
    }
    
    @objc private func pushCommentPage(sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .Decorator)
    }
}
