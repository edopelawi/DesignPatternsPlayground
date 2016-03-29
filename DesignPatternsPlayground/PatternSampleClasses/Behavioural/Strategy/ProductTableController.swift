//
//  ProductTableController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation
import UIKit

class ProductTableController: NSObject, UITableViewDataSource {
    
    internal var products = [Product]() {
        didSet {
            if let tableView = controlledTableView {
                tableView.reloadData()
            }
        }
    }
    
    private let reuseIdentifier = "productCellReuseIdentifier"
    
    private var controlledTableView: UITableView! {
        didSet {
            if (oldValue != nil && oldValue != controlledTableView) {
                oldValue.dataSource = nil
            }
        }
    }
    
    // MARK: - Public methods -
    
    /**
     Controls passed `tableView` to present this instance's `products`.
     
     - parameter tableView: `UITableView` instance
     */
    func controlTableView(tableView: UITableView) {
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        controlledTableView = tableView
    }
    
    /**
     Sort this instance's `products` using passed `productSorter`.
     
     - parameter productSorter: `ProductSorder` instance
     */
    func sortProductsWithSorter(productSorter: ProductSorter) {
        products = productSorter.sortProducts(products)
    }
    
    // MARK: - UITableViewDataSource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = controlledTableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "\(product.price)"
        
        return cell
    }    
}