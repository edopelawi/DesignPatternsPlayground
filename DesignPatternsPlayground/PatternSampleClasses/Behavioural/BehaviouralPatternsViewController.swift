//
//  BehaviouralPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class BehaviouralPatternsViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var tableController: PatternTypeTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        title = "Behavioural Design Patterns"
        
        tableView.backgroundColor = view.backgroundColor
        
        tableController = PatternTypeTableController(
            tableView: tableView,
            patternGroupType: .behavioural
        )
        
        tableController.patternTypeSelectedClosure = {
            [weak self] patternType in
            
            print("Selected pattern: \(patternType)")
            
            if let behaviouralType = patternType as? BehaviouralPatternType {
                self?.pushPageForPatternType(behaviouralType)
            }
        }
    }

    // MARK: - Private Methods -
    
    fileprivate func pushPageForPatternType(_ patternType: BehaviouralPatternType) {
        
        var viewController: UIViewController?
        
        // TODO: Push appropriate view controllers here
        switch patternType {
        case .strategy: viewController = StrategySampleViewController()
        case .observer: viewController = ObserverSampleViewController()
        case .templateMethod: viewController = TemplateMethodSampleViewController()
		case .memento: viewController = MementoSampleViewController()
		case .command: viewController = CommandSampleViewController()
        default: break
        }
        
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
