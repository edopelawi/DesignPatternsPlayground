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

    @IBOutlet private weak var terrainSelectionButton: UIButton!
    
    @IBOutlet private weak var terrainTopLabel: UILabel!
    @IBOutlet private weak var terrainBottomLabel: UILabel!
    
    @IBOutlet private weak var jamesBondCarLabel: UILabel!
    
    private var viewModel = BridgeSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bond's Super Car!"
        viewModel.delegate = self
        loadStringsFromCurrentViewModel()
    }
    
    // MARK: IBOutlets
    
    @IBAction func showTerrainOptions(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Terrain Types", message: "", preferredStyle: .ActionSheet)
        
        for terrain in viewModel.terrainOptions {
            
            let action = UIAlertAction(
                title: terrain.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedTerrain = terrain
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    
    // MARK: BridgeSampleViewModelDelegate methods
    
    func selectedTerrainUpdated(viewModel: BridgeSampleViewModel, selectedTerrain: JamesBondTerrainType) {
        let selectionButtonTitle = selectedTerrain.rawValue
        terrainSelectionButton.setTitle(selectionButtonTitle, forState: .Normal)
        terrainSelectionButton.setTitle(selectionButtonTitle, forState: .Highlighted)
    }
    
    func bondCarWithEffectsUpdated(viewModel: BridgeSampleViewModel, bondCarWithEffects: String) {
        jamesBondCarLabel.text = bondCarWithEffects
    }
    
    func terrainEmojisUpdated(viewModel: BridgeSampleViewModel, terrainEmojis: String) {
        terrainTopLabel.text = terrainEmojis
        terrainBottomLabel.text = terrainEmojis
    }
    
    // MARK: Private methods
    
    private func loadStringsFromCurrentViewModel() {
        terrainTopLabel.text = viewModel.terrainEmojis
        terrainBottomLabel.text = viewModel.terrainEmojis
        jamesBondCarLabel.text = viewModel.bondCarWithEffects
        
        let selectionButtonTitle = viewModel.selectedTerrain.rawValue
        terrainSelectionButton.setTitle(selectionButtonTitle, forState: .Normal)
        terrainSelectionButton.setTitle(selectionButtonTitle, forState: .Highlighted)
    }

}
