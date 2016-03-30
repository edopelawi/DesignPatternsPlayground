//
//  ObserverSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit


enum ObserverSampleTableSection: Int {
    case AttackerAliens = 0
    case MaintainerAliens = 1
    
    static func numberOfSections() -> Int {
        return 2
    }
}

class ObserverSampleViewController: UITableViewController {
        
    @IBOutlet private var headerView: UIView!
    @IBOutlet private weak var mothershipMessageButton: UIButton!
    
    private var motherShip = AlienMothership()
    
    private var attackerShips = [AlienAttackerShip]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var maintainerShips = [AlienRepairShip]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var cellReuseIdentifier = "alienCellReuseIdentifer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alien's Super-fast Comms"
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.tableHeaderView = headerView
    }

    // MARK: - IBActions -
    
    @IBAction func showMothershipMessageOption(sender: UIButton) {
        // TODO: Show message options here
    }
    
    @IBAction func addAttackerShip(sender: UIButton) {
        let attackerShip = AlienAttackerShip()
        
        motherShip.addListener(attackerShip)
        attackerShips.append(attackerShip)
    }
    
    @IBAction func addMaintainerShip(sender: UIButton) {
        let maintainerShip = AlienRepairShip()
        
        motherShip.addListener(maintainerShip)
        maintainerShips.append(maintainerShip)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ObserverSampleTableSection.numberOfSections()
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let validSection = ObserverSampleTableSection(rawValue: section) else {
            return nil
        }
        
        switch validSection {
        case .AttackerAliens: return "Attacker Ships"
        case .MaintainerAliens: return "Maintainer Ships"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let validSection = ObserverSampleTableSection(rawValue: section) else {
            return 0
        }
        
        switch validSection {
        case .AttackerAliens: return attackerShips.count
        case .MaintainerAliens: return maintainerShips.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: CGFloat(14))
        cell.textLabel?.text = ""
        
        guard let validSection = ObserverSampleTableSection(rawValue: indexPath.section) else {
            return cell
        }
        
        let mothershipListener: AlienMothershipListener
        var listenerIcon = ""
        
        switch validSection {
        case .AttackerAliens:
            mothershipListener = attackerShips[indexPath.row]
            listenerIcon = "👾"
            
        case .MaintainerAliens:
            mothershipListener = maintainerShips[indexPath.row]
            listenerIcon = "👽"
        }
        
        cell.textLabel?.text = "\(listenerIcon) #\(indexPath.row): \(mothershipListener.shipCurrentStatus())"
        
        return cell
    }
}
