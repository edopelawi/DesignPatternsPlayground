//
//  BuilderSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class BuilderSampleViewController: UITableViewController, BuilderSampleViewModelDelegate {
        
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var footerView: UIView!
    
    @IBOutlet weak var packageSelectionButton: UIButton!
    
    private let reuseIdentifier = "reuseIdentifier"
    
    private let viewModel = BuilderSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Order A Burger!"
        
        viewModel.delegate = self
        
        prepareTableView()
        preparePackageButton()

    }
    
    // MARK: headerView and footerView's button actions

    @IBAction func clearOrderPartSelections(sender: AnyObject) {
        viewModel.resetOrderPartSelections()
        tableView.reloadData()
    }

    @IBAction func showPackageOptions(sender: AnyObject) {
        
        let actionController = packageSelectionAlertController()
        self.presentViewController(actionController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orderPartNames.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select your order!"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        cell.selectionStyle = .None
        cell.textLabel?.text = viewModel.orderPartNames[indexPath.row]

        let cellSelected = viewModel.orderPartSelectedMarker[indexPath.row]
        cell.accessoryType = cellSelected ? .Checkmark : .None

        return cell
    }
    

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        viewModel.orderPartSelectedMarker[indexPath.row] = true
        tableView.reloadRowsAtIndexPaths([ indexPath ], withRowAnimation: .Fade)
    }
    
    
    // MARK: - BuilderSampleViewModel delegate
    
    func viewModel(viewModel: BuilderSampleViewModel, selectedPackageChanged: BurgerOrderPackage) {
        
        packageSelectionButton.setTitle(selectedPackageChanged.rawValue, forState: .Normal);
        packageSelectionButton.setTitle(selectedPackageChanged.rawValue, forState: .Highlighted);
    }
    
    // MARK: - Private methods
    
    private func prepareTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    private func preparePackageButton() {
        
        let initialTitle = viewModel.selectedPackage.rawValue
        
        packageSelectionButton.setTitle(initialTitle, forState: .Normal)
        packageSelectionButton.setTitle(initialTitle, forState: .Highlighted)
    }
    
    private func packageSelectionAlertController() -> UIAlertController {
        
        let alertController = UIAlertController(
            title: nil,
            message: "Choose package!",
            preferredStyle: .ActionSheet
        )
        
        for orderPackage in viewModel.orderPackages {
            
            let action = UIAlertAction(
                title: orderPackage,
                style: .Default,
                handler: {
                    [weak self] alert in
                    
                    if let burgerPackage = BurgerOrderPackage(rawValue: orderPackage) {
                        self?.viewModel.selectedPackage = burgerPackage
                    }
            })
            
            alertController.addAction(action)
        }
        
        return alertController
    }
}
