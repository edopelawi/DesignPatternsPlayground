//
//  StructuralPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class StructuralPatternsViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate var tableController: PatternTypeTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        title = "Structural Design Patterns"
        
        tableView.backgroundColor = view.backgroundColor
        
        tableController = PatternTypeTableController(
            tableView: tableView,
            patternGroupType: .structural
        )
        
        tableController.patternTypeSelectedClosure = {
            [weak self] patternType in

            print("Selected pattern: \(patternType)")
            
            if let structuralPatternType = patternType as? StructuralPatternType {
                
                self?.pushPageForPatternType(structuralPatternType)
            }
        }
    }
    
    fileprivate func pushPageForPatternType(_ patternType: StructuralPatternType) {

        var optionalViewController: UIViewController?
        
        switch patternType {
        case .adapter: optionalViewController = AdapterSampleViewController()
        case .bridge: optionalViewController = BridgeSampleViewController()
        case .composite: optionalViewController = CompositeSampleViewController()
        case .decorator: optionalViewController = DecoratorSampleViewController()
        case .flyweight: optionalViewController = FlyweightSampleViewController()
        case .proxy: optionalViewController = ProxySampleViewController()
        case .facade: optionalViewController = FacadeSampleViewController()
        }
        
        if let viewController = optionalViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
