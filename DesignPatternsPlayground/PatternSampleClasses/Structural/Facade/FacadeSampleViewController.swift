//
//  FacadeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/14/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FacadeSampleViewController: UITableViewController {
    
    fileprivate let christmasDecoration = ChristmasDecoration();
    fileprivate let cellReuseIdentifier = "reuseIdentifier";

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var batteryChargeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        prepareChristmasDecorationHandlers()
        
        christmasDecoration.rechargeBattery()
        
        tableView.tableHeaderView = headerView
        
        addCommentBarButton()
    }
    
    fileprivate func addCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(FacadeSampleViewController.pushCommentsPage(_:)))
    }
    
    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .facade)
    }
    
    // MARK: - Header button handler -
    
    @IBAction func rechargeBattery(_ sender: UIButton) {
        christmasDecoration.rechargeBattery()
        christmasDecoration.turnAllLightsOn()
        tableView.reloadData()
    }
    
    @IBAction func addAnotherLight(_ sender: UIButton) {
        christmasDecoration.addChristmasLights()
        tableView.reloadData()
    }
    
    // MARK: - Christmas Decoration handlers -
    
    fileprivate func prepareChristmasDecorationHandlers() {
        
        christmasDecoration.batteryChargeUpdatedBlock = {
            [weak self] numberOfCharge in
            self?.batteryChargeLabel.text = "Battery Charge: \(numberOfCharge)%"
            self?.tableView.reloadData()
        }
        
        christmasDecoration.christmasLightUpdatedBlock = {
            [weak self] lightIndex, christmasLight in
            
            let indexPath = IndexPath(item: lightIndex, section: 0)
            
            self?.tableView.reloadRows(at: [ indexPath ], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // MARK: - Table view data source -
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return christmasDecoration.christmasLights.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        let christmasLight = christmasDecoration.christmasLights[indexPath.row]
        
        cell.textLabel?.text = christmasLight.lightEmojis
        
        return cell
    }
    
}
