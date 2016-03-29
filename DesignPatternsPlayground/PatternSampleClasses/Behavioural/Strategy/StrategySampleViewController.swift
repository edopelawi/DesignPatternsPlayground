//
//  StrategySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class StrategySampleViewController: UITableViewController {
    
    private let tableController = ProductTableController()
    @IBOutlet private var headerView: UIView!
    @IBOutlet private weak var sortButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Product List!"
        
        tableView.tableHeaderView = headerView
        
        tableController.controlTableView(self.tableView)
        
        generateDummyProducts()
    }
    
    private func generateDummyProducts() {
        
        tableController.products = [
            Product(name: "Pricy Shoes 👠", price: 50000),
            Product(name: "Nice Shirt 👕", price: 10000),
            Product(name: "Cool Shades 🕶", price: 15000),
            Product(name: "Branded Purse 👛", price: 75000),
            Product(name: "Leather Briefcase 💼", price: 35000)
        ]
    }
    
    @IBAction func showSortOptions(sender: UIButton) {
        
        let alertController = createOptionsAlertController()
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func createOptionsAlertController() -> UIAlertController {
        
        let alertController = UIAlertController(title: "Sort Options", message: nil, preferredStyle: .ActionSheet)
        
        let defaultAction = UIAlertAction(
            title: "None",
            style: .Default,
            handler: {
                [weak self] _ in
                self?.sortButton.setTitle("None", forState: .Normal)
                self?.generateDummyProducts()
            }
        )
        
        alertController.addAction(defaultAction)
        
        let sorters: [(name: String, sorter: ProductSorter)] = [
            (name: "Name (Ascending)", sorter: AscendingNameProductSorter()),
            (name: "Name (Descending)", sorter: DescendingNameProductSorter()),
            (name: "Price (Ascending)", sorter: AscendingPriceProductSorter()),
            (name: "Price (Descending)", sorter: DescendingPriceProductSorter())
        ]
        
        for (name, sorter) in sorters {
            
            let action = UIAlertAction(
                title: name,
                style: .Default,
                handler: {
                    [weak self] _ in
                    self?.sortButton.setTitle(name, forState: .Normal)
                    self?.tableController.sortProductsWithSorter(sorter)
                })
            
            alertController.addAction(action)
        }
        
        return alertController
    }
}
