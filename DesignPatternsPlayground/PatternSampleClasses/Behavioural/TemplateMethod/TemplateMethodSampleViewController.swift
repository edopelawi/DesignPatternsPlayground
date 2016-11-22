//
//  TemplateMethodSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/31/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class TemplateMethodSampleViewController: UIViewController {
    
    @IBOutlet fileprivate weak var felineSelectionButton: UIButton!
    @IBOutlet fileprivate weak var diaryLabel: UILabel!
    
    fileprivate var felines = [Feline]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "🐾 Feline's Diaries 🐾"
        prepareFelines()
        addCommentsRightBarButton(target: self, action: #selector(TemplateMethodSampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: AnyObject) {
        self.pushCommentaryPage(behaviouralPatternType: .templateMethod)
    }

    // MARK: - IBAction -
    
    @IBAction func showFelineOptions(_ sender: UIButton) {
        let alert = createOptionsAlertController()
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods -
    fileprivate func prepareFelines() {
        
        felines = [
            Feline(name: "Joe 🐱", gender: .male),
            DomesticCat(name: "Martha 🐱", gender: .female),
            DomesticCat(name: "Raplh 🐱", gender: .male),
            Lion(name: "Simba 🦁", gender: .male),
            Tiger(name: "Jade 🐯", gender: .female)
        ]
    }
    
    fileprivate func createOptionsAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Felines!", message: nil, preferredStyle: .actionSheet)
        
        for feline in felines {
            let action = UIAlertAction(
                title: feline.name,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.felineSelectionButton.setTitle(feline.name, for: UIControlState())
                    self?.diaryLabel.text = feline.liveAnotherDay()
                }
            )
            
            alertController.addAction(action)
        }
        
        return alertController
    }
    
}
