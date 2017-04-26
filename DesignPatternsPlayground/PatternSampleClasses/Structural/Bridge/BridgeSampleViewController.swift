//
//  BridgeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/20/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit
import JamesBondTools

class BridgeSampleViewController: UIViewController, BridgeSampleViewModelDelegate {

    @IBOutlet fileprivate weak var terrainSelectionButton: UIButton!
    
    @IBOutlet fileprivate weak var terrainTopLabel: UILabel!
    @IBOutlet fileprivate weak var terrainBottomLabel: UILabel!
    
    @IBOutlet fileprivate weak var jamesBondCarLabel: UILabel!
    
    fileprivate var viewModel = BridgeSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bond's Super Car!"
        viewModel.delegate = self
        loadStringsFromCurrentViewModel()
        prepareCommentBarButton()
    }
    
    // MARK: IBOutlets
    
    @IBAction func showTerrainOptions(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Terrain Types", message: "", preferredStyle: .actionSheet)
        
        for terrain in viewModel.terrainOptions {
            
            let action = UIAlertAction(
                title: terrain.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedTerrain = terrain
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    // MARK: BridgeSampleViewModelDelegate methods
    
    func selectedTerrainUpdated(_ viewModel: BridgeSampleViewModel, selectedTerrain: JamesBondTerrainType) {
        let selectionButtonTitle = selectedTerrain.rawValue
        terrainSelectionButton.setTitle(selectionButtonTitle, for: UIControlState())
        terrainSelectionButton.setTitle(selectionButtonTitle, for: .highlighted)
    }
    
    func bondCarWithEffectsUpdated(_ viewModel: BridgeSampleViewModel, bondCarWithEffects: String) {
        jamesBondCarLabel.text = bondCarWithEffects
    }
    
    func terrainEmojisUpdated(_ viewModel: BridgeSampleViewModel, terrainEmojis: String) {
        terrainTopLabel.text = terrainEmojis
        terrainBottomLabel.text = terrainEmojis
    }
    
    // MARK: Private methods
    
    fileprivate func prepareCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(BridgeSampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .bridge)
    }
    
    fileprivate func loadStringsFromCurrentViewModel() {
        terrainTopLabel.text = viewModel.terrainEmojis
        terrainBottomLabel.text = viewModel.terrainEmojis
        jamesBondCarLabel.text = viewModel.bondCarWithEffects
        
        let selectionButtonTitle = viewModel.selectedTerrain.rawValue
        terrainSelectionButton.setTitle(selectionButtonTitle, for: UIControlState())
        terrainSelectionButton.setTitle(selectionButtonTitle, for: .highlighted)
    }

}
