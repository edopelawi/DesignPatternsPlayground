//
//  CreationalPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CreationalPatternsViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var tableController: PatternTypeTableController!
    
    // MARK: - UIViewController -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        title = "Creational Design Patterns"
        
        tableView.backgroundColor = view.backgroundColor
        
        tableController = PatternTypeTableController(
            tableView: tableView,
            patternGroupType: .creational
        )
        
        tableController.patternTypeSelectedClosure = {
            [weak self] patternType in
            
            print("Selected pattern: \(patternType)")
            
            if let creationalType = patternType as? CreationalPatternType {
                self?.pushPageForPatternType(creationalType)
            }
        }
        
    }
    
    // MARK: - Private Methods -
    
    fileprivate func pushPageForPatternType(_ patternType: CreationalPatternType) {

        var viewController: UIViewController?
        
        switch patternType {
        case .abstractFactory: viewController = AbstractFactorySampleViewController()
        case .factoryMethod: viewController = FactoryMethodSampleViewController()
        case .builder: viewController = BuilderSampleViewController()
        case .prototype: viewController = PrototypeSampleViewController()
        case .singleton: viewController = SingletonSampleViewController()
        }
        
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
