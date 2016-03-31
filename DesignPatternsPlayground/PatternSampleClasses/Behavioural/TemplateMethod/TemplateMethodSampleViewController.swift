//
//  TemplateMethodSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TemplateMethodSampleViewController: UIViewController {
    
    @IBOutlet private weak var felineSelectionButton: UIButton!
    @IBOutlet private weak var diaryLabel: UILabel!
    
    private var felines = [Feline]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "🐾 Feline's Diaries 🐾"
        prepareFelines()
    }

    // MARK: - IBAction -
    
    @IBAction func showFelineOptions(sender: UIButton) {
        let alert = createOptionsAlertController()
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods -
    private func prepareFelines() {
        
        felines = [
            Feline(name: "Joe 🐱", gender: .Male),
            DomesticCat(name: "Martha 🐱", gender: .Female),
            DomesticCat(name: "Raplh 🐱", gender: .Male),
            Lion(name: "Simba 🦁", gender: .Male),
            Tiger(name: "Jade 🐯", gender: .Female)
        ]
    }
    
    private func createOptionsAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Felines!", message: nil, preferredStyle: .ActionSheet)
        
        for feline in felines {
            let action = UIAlertAction(
                title: feline.name,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.felineSelectionButton.setTitle(feline.name, forState: .Normal)
                    self?.diaryLabel.text = feline.liveAnotherDay()
                }
            )
            
            alertController.addAction(action)
        }
        
        return alertController
    }
    
}
