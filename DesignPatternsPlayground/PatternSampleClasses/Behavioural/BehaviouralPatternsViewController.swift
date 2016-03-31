//
//  BehaviouralPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class BehaviouralPatternsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var tableController: PatternTypeTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = false
        title = "Behavioural Design Patterns"
        
        tableView.backgroundColor = view.backgroundColor
        
        tableController = PatternTypeTableController(
            tableView: tableView,
            patternGroupType: .Behavioural
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
    
    private func pushPageForPatternType(patternType: BehaviouralPatternType) {
        
        var viewController: UIViewController?
        
        // TODO: Push appropriate view controllers here
        switch patternType {
        case .Strategy: viewController = StrategySampleViewController()
        case .Observer: viewController = ObserverSampleViewController()
        default: break
        }
        
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
