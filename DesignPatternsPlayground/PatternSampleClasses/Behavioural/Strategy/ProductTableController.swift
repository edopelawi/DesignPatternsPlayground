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
    
    fileprivate let reuseIdentifier = "productCellReuseIdentifier"
    
    fileprivate var controlledTableView: UITableView! {
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
    func controlTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.reloadData()
        controlledTableView = tableView
    }
    
    /**
     Sort this instance's `products` using passed `productSorter`.
     
     - parameter productSorter: `ProductSorder` instance
     */
    func sortProductsWithSorter(_ productSorter: ProductSorter) {
        products = productSorter.sortProducts(products)
    }
    
    // MARK: - UITableViewDataSource -
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        
        if let reusedCell = controlledTableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
            cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: CGFloat(15))
            cell.detailTextLabel?.font = UIFont(name: "Avenir-Book", size:CGFloat(13))
        }
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "\(product.price)"
        
        return cell
    }    
}
