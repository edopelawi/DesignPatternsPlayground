//
//  AdapterSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class AdapterSampleViewController: UIViewController, AdapterSampleViewModelDelegate {

    @IBOutlet private weak var placeButton: UIButton!
    @IBOutlet private weak var orderButton: UIButton!

    @IBOutlet private weak var generatedDialogueLabel: UILabel!
    
    private var viewModel = AdapterSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rotana's Culinary Trip!"
        viewModel.delegate = self
        configureInitialTexts()
    }
    
    // MARK: IBActions
    
    @IBAction func showPlaceOptions(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Culinary Places", message: "", preferredStyle: .ActionSheet)
        
        for place in viewModel.placeOptions {
    
            let action = UIAlertAction(
                title: place.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedPlace = place
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func showOrderOptions(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Order Actions", message: "", preferredStyle: .ActionSheet)
        
        for order in viewModel.orderOptions {
            
            let action = UIAlertAction(
                title: order.rawValue,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedOrder = order
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: AdapterSampleViewModelDelegate
    
    func currentDialogueUpdated(viewModel: AdapterSampleViewModel, currentDialogue: String) {
        generatedDialogueLabel.text = currentDialogue
    }
    
    func selectedOrderUpdated(viewModel: AdapterSampleViewModel, selectedOrder: AdapterSampleOrder) {
        orderButton.setTitle(selectedOrder.rawValue, forState: .Normal)
        orderButton.setTitle(selectedOrder.rawValue, forState: .Highlighted)
    }
    
    func selectedPlaceUpdated(viewModel: AdapterSampleViewModel, selectedPlace: AdapterSamplePlace) {
        placeButton.setTitle(selectedPlace.rawValue, forState: .Normal)
        placeButton.setTitle(selectedPlace.rawValue, forState: .Highlighted)
    }

    // MARK: Private methods
    
    private func configureInitialTexts() {

        placeButton.setTitle(viewModel.selectedPlace.rawValue, forState: .Normal)
        placeButton.setTitle(viewModel.selectedPlace.rawValue, forState: .Highlighted)
        
        orderButton.setTitle(viewModel.selectedPlace.rawValue, forState: .Normal)
        orderButton.setTitle(viewModel.selectedPlace.rawValue, forState: .Highlighted)
        
        generatedDialogueLabel.text = viewModel.currentDialogue
    }
    
}
