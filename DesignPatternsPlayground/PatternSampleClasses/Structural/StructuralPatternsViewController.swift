//
//  StructuralPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class StructuralPatternsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var tableController: PatternTypeTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = false
        title = "Structural Design Patterns"
        
        tableView.backgroundColor = view.backgroundColor
        
        tableController = PatternTypeTableController(
            tableView: tableView,
            patternGroupType: .Structural
        )
        
        tableController.patternTypeSelectedClosure = {
            [weak self] patternType in

            print("Selected pattern: \(patternType)")
            
            if let structuralPatternType = patternType as? StructuralPatternType {
                
                self?.pushPageForPatternType(structuralPatternType)
            }
        }
    }
    
    private func pushPageForPatternType(patternType: StructuralPatternType) {

        var optionalViewController: UIViewController?
        
        switch patternType {
        case .Adapter: optionalViewController = AdapterSampleViewController()
        case .Bridge: optionalViewController = BridgeSampleViewController()
        case .Composite: optionalViewController = CompositeSampleViewController()
        case .Decorator: optionalViewController = DecoratorSampleViewController()
        case .Proxy: optionalViewController = ProxySampleViewController()
        default: break
        }
        
        if let viewController = optionalViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
