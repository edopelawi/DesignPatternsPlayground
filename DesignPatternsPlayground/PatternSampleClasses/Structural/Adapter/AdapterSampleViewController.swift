//
//  AdapterSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class AdapterSampleViewController: UIViewController, AdapterSampleViewModelDelegate {

    @IBOutlet fileprivate weak var placeButton: UIButton!
    @IBOutlet fileprivate weak var orderButton: UIButton!

    @IBOutlet fileprivate weak var generatedDialogueLabel: UILabel!
    
    fileprivate var viewModel = AdapterSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rotana's Culinary Trip!"
        viewModel.delegate = self
        configureInitialTexts()
        configureCommentBarButton()
    }
    
    fileprivate func configureCommentBarButton() {

        addCommentsRightBarButton(target: self, action: #selector(AdapterSampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .adapter)
    }
    
    // MARK: IBActions
    
    @IBAction func showPlaceOptions(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Culinary Places", message: "", preferredStyle: .actionSheet)
        
        for place in viewModel.placeOptions {
    
            let action = UIAlertAction(
                title: place.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedPlace = place
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func showOrderOptions(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Order Actions", message: "", preferredStyle: .actionSheet)
        
        for order in viewModel.orderOptions {
            
            let action = UIAlertAction(
                title: order.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.viewModel.selectedOrder = order
                }
            )
            
            actionSheet.addAction(action)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: AdapterSampleViewModelDelegate
    
    func currentDialogueUpdated(_ viewModel: AdapterSampleViewModel, currentDialogue: String) {
        generatedDialogueLabel.text = currentDialogue
    }
    
    func selectedOrderUpdated(_ viewModel: AdapterSampleViewModel, selectedOrder: AdapterSampleOrder) {
        orderButton.setTitle(selectedOrder.rawValue, for: UIControlState())
        orderButton.setTitle(selectedOrder.rawValue, for: .highlighted)
    }
    
    func selectedPlaceUpdated(_ viewModel: AdapterSampleViewModel, selectedPlace: AdapterSamplePlace) {
        placeButton.setTitle(selectedPlace.rawValue, for: UIControlState())
        placeButton.setTitle(selectedPlace.rawValue, for: .highlighted)
    }

    // MARK: Private methods
    
    fileprivate func configureInitialTexts() {

        placeButton.setTitle(viewModel.selectedPlace.rawValue, for: UIControlState())
        placeButton.setTitle(viewModel.selectedPlace.rawValue, for: .highlighted)
        
        orderButton.setTitle(viewModel.selectedPlace.rawValue, for: UIControlState())
        orderButton.setTitle(viewModel.selectedPlace.rawValue, for: .highlighted)
        
        generatedDialogueLabel.text = viewModel.currentDialogue
    }
    
}
