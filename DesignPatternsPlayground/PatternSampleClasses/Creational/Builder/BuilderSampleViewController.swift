//
//  BuilderSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class BuilderSampleViewController: UITableViewController, BuilderSampleViewModelDelegate {
        
    @IBOutlet fileprivate var headerView: UIView!
    @IBOutlet fileprivate var footerView: UIView!
    
    @IBOutlet weak var packageSelectionButton: UIButton!
    
    fileprivate let reuseIdentifier = "reuseIdentifier"
    
    fileprivate let viewModel = BuilderSampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Order A Burger!"
        
        viewModel.delegate = self
        
        prepareCommentBarButtons()
        
        prepareTableView()
        preparePackageButton()

    }
    
    fileprivate func prepareCommentBarButtons() {
        self.addCommentsRightBarButton(target: self, action: #selector(BuilderSampleViewController.pushCommentButton(_:)))
    }
    
    @objc fileprivate func pushCommentButton(_ sender: AnyObject) {
        self.pushCommentaryPage(creationalPatternType: .builder);
    }
    
    // MARK: headerView and footerView's button actions

    @IBAction func clearOrderPartSelections(_ sender: AnyObject) {
        viewModel.resetOrderPartSelections()
        tableView.reloadData()
    }

    @IBAction func showPackageOptions(_ sender: AnyObject) {
        
        let actionController = packageSelectionAlertController()
        self.present(actionController, animated: true, completion: nil)
    }
    
    @IBAction func sendOrder(_ sender: AnyObject) {
        
        let order = viewModel.createBurderOrder()
        
        let alert = UIAlertController(
            title: "Order sent!",
            message: order.description(),
            preferredStyle: .alert
        )
        
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(dismissAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orderPartNames.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select your order!"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel.orderPartNames[indexPath.row]

        let cellSelected = viewModel.orderPartSelectedMarker[indexPath.row]
        cell.accessoryType = cellSelected ? .checkmark : .none

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.orderPartSelectedMarker[indexPath.row] = true
        tableView.reloadRows(at: [ indexPath ], with: .fade)
    }
    
    
    // MARK: - BuilderSampleViewModel delegate
    
    func viewModel(_ viewModel: BuilderSampleViewModel, selectedPackageChanged: BurgerOrderPackage) {
        
        packageSelectionButton.setTitle(selectedPackageChanged.rawValue, for: UIControlState());
        packageSelectionButton.setTitle(selectedPackageChanged.rawValue, for: .highlighted);
    }
    
    // MARK: - Private methods
    
    fileprivate func prepareTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    fileprivate func preparePackageButton() {
        
        let initialTitle = viewModel.selectedPackage.rawValue
        
        packageSelectionButton.setTitle(initialTitle, for: UIControlState())
        packageSelectionButton.setTitle(initialTitle, for: .highlighted)
    }
    
    fileprivate func packageSelectionAlertController() -> UIAlertController {
        
        let alertController = UIAlertController(
            title: nil,
            message: "Choose package!",
            preferredStyle: .actionSheet
        )
        
        for orderPackage in viewModel.orderPackages {
            
            let action = UIAlertAction(
                title: orderPackage,
                style: .default,
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
