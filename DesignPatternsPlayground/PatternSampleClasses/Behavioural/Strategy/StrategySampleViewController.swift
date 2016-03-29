//
//  StrategySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class StrategySampleViewController: UITableViewController {
    
    let tableController = ProductTableController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
    
}
