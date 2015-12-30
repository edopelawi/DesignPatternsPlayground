//
//  BuilderSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit


enum BurgerOrderRows: Int {
    case Burger = 0
    case Drinks = 1
    case Fries = 2
    case Salads = 3
    case Sweets = 4
    
    static func numberOfRows() -> Int {
        return 5
    }
    
    func toString() -> String {
        switch self {
        case .Burger: return "Burger"
        case .Drinks: return "Drinks"
        case .Fries: return "Fries"
        case .Salads: return "Salads"
        case .Sweets: return "Sweets"
        }
    }
}

class BuilderSampleViewController: UITableViewController {
        
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var footerView: UIView!
    
    private let reuseIdentifier = "reuseIdentifier"
    
    private var selectionMarker = Array(
        count: BurgerOrderRows.numberOfRows(),
        repeatedValue: false
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Order A Burger!"
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        // TODO: Add headerView and footerView here.
    }
    
    // TODO: Add headerView and footerView's action here.

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BurgerOrderRows.numberOfRows()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        cell.selectionStyle = .None
        cell.textLabel?.text = ""
        
        if let row = BurgerOrderRows(rawValue: indexPath.row) {
            cell.textLabel?.text = row.toString()
        }
        
        let cellSelected = (indexPath.row < selectionMarker.count) &&
            (selectionMarker[indexPath.row] == true)

        cell.accessoryType = cellSelected ? .Checkmark : .None
        

        return cell
    }
    

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row < selectionMarker.count {
            selectionMarker[indexPath.row] = true

            tableView.reloadRowsAtIndexPaths([ indexPath ], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}
