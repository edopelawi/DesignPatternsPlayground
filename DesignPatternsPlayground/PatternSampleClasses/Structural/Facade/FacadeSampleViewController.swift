//
//  FacadeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FacadeSampleViewController: UITableViewController {
    
    private let christmasDecoration = ChristmasDecoration();
    private let cellReuseIdentifier = "reuseIdentifier";

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var batteryChargeLabel: UILabel!
    
    
    // MARK: - Header button handler -
    
    @IBAction func rechargeBattery(sender: UIButton) {
        christmasDecoration.rechargeBatteryVoltage()
        christmasDecoration.turnAllLightsOn()
        tableView.reloadData()
    }
    
    @IBAction func addAnotherLight(sender: UIButton) {        
        christmasDecoration.addChristmasLights()
        christmasDecoration.turnAllLightsOn()
        tableView.reloadData()
    }
    
    // MARK: - Christmas Decoration handlers -
    
    private func prepareChristmasDecorationHandlers() {
        
        christmasDecoration.batteryChargeUpdatedBlock = {
            [weak self] numberOfCharge in
            self?.batteryChargeLabel.text = "Battery Charge: \(numberOfCharge)%"
            self?.tableView.reloadData()
        };
    }
    
    // MARK: - Table view data source -

    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        christmasDecoration.turnAllLightsOn()
        
        tableView.tableHeaderView = headerView
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return christmasDecoration.christmasLights.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)

        let christmasLight = christmasDecoration.christmasLights[indexPath.row]
        
        cell.textLabel?.text = christmasLight.lightEmojis

        print("Christmas light for row \(indexPath.row): \(christmasLight.lightEmojis)")
        
        return cell
    }
    
}
