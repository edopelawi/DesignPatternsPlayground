//
//  DecoratorSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/22/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class DecoratorSampleViewController: UIViewController, DecoratorSampleViewModelDelegate {

    @IBOutlet fileprivate weak var fightingMoveButton: UIButton!
    @IBOutlet fileprivate weak var armamentButton: UIButton!
    
    @IBOutlet fileprivate weak var resultLabel: UILabel!
    
    fileprivate var viewModel = DecoratorSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Street Fighter!"
        viewModel.delegate = self
        loadInitialViewModelValue()
        addCommentBarButton()
    }
    
    @IBAction func showFightingMoveOptions(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Fighting Moves", message: "", preferredStyle: .actionSheet)
        
        for fightingMove in viewModel.fightingMoveOptions {
            
            let action = UIAlertAction(
                title: fightingMove.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedFightingMove = fightingMove
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }

    @IBAction func showArmamentOptions(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Fighting Armaments", message: "", preferredStyle: .actionSheet)
        
        for armament in viewModel.armamentOptions {
            
            let action = UIAlertAction(
                title: armament.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedArmament = armament
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: DecoratorSampleViewModelDelegate
    
    func selectedArmamentUpdated(_ viewModel: DecoratorSampleViewModel, selectedArmament: DecoratorSampleViewModelArmaments) {
        armamentButton.setTitle(selectedArmament.rawValue, for: UIControlState())
        armamentButton.setTitle(selectedArmament.rawValue, for: .highlighted)
    }
    
    func selectedFightingMoveUpdated(_ viewModel: DecoratorSampleViewModel, selectedFightingMove: DecoratorSampleViewModelMoves) {
        fightingMoveButton.setTitle(selectedFightingMove.rawValue, for: UIControlState())
        fightingMoveButton.setTitle(selectedFightingMove.rawValue, for: .highlighted)
    }
    
    func resultMoveUpdated(_ viewModel: DecoratorSampleViewModel, resultMove: String) {
        resultLabel.text = resultMove
    }
    
    // MARK: Private methods
    
    fileprivate func loadInitialViewModelValue() {
        let selectedArmamentString = viewModel.selectedArmament.rawValue
        armamentButton.setTitle(selectedArmamentString, for: UIControlState())
        armamentButton.setTitle(selectedArmamentString, for: .highlighted)
        
        let selectedMoveString = viewModel.selectedFightingMove.rawValue
        fightingMoveButton.setTitle(selectedMoveString, for: UIControlState())
        fightingMoveButton.setTitle(selectedMoveString, for: .highlighted)
        
        resultLabel.text = viewModel.resultMove
    }
    
    fileprivate func addCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(DecoratorSampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .decorator)
    }
}
