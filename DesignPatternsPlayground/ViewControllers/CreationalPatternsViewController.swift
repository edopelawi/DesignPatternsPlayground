//
//  CreationalPatternsViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/23/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class CreationalPatternsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet private weak var tableView: UITableView!
    private let cellReuseIdentifier = "creatiionalCellIdentifier"
    
    // MARK: - UIViewController -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBarHidden = false
        title = "Creational Design Patterns"
        
        configureTableView()
    }
    
    // MARK: - Private Methods -
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = view.backgroundColor
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    private func configureCell(cell: UITableViewCell, forRow row: Int) {
        
        let optionalType = CreationaPatternType(rawValue: row)
        
        var text = ""
        
        if let typeName = optionalType?.toString() {
            text = typeName
        }
        
        cell.textLabel?.text = text
        
        cell.backgroundColor = view.backgroundColor
        cell.accessoryType = .DisclosureIndicator
        
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    // MARK: - UITableView Delegate and Datasource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CreationaPatternType.numberOfTypes()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        self.configureCell(cell, forRow: indexPath.row)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var selectedPatternName = ""
        
        if let patternType = CreationaPatternType(rawValue: indexPath.row) {
            selectedPatternName = patternType.toString()
            
            var viewController: UIViewController?
            
            switch patternType {
            case .AbstractFactory: viewController = AbstractFactorySampleViewController()
            case .FactoryMethod: viewController = FactoryMethodSampleViewController()
            default: break
            }
            
            if let viewController = viewController {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
        print("Selected pattern: \(selectedPatternName)")
        
        // TODO: push corresponding sample page here.
        
    }
}
