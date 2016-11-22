//
//  ObserverSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/30/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit


enum ObserverSampleTableSection: Int {
    case attackerAliens = 0
    case maintainerAliens = 1
    
    static func numberOfSections() -> Int {
        return 2
    }
}

class ObserverSampleViewController: UITableViewController {
        
    @IBOutlet fileprivate var headerView: UIView!
    @IBOutlet fileprivate weak var mothershipMessageButton: UIButton!
    
    fileprivate var motherShip = AlienMothership()
    
    fileprivate var attackerShips = [AlienAttackerShip]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    fileprivate var maintainerShips = [AlienRepairShip]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    fileprivate var cellReuseIdentifier = "alienCellReuseIdentifer"
    
    deinit {
            
        for attackerShip in attackerShips {
            motherShip.removeListener(attackerShip)
        }
        
        for maintainerShip in maintainerShips {
            motherShip.removeListener(maintainerShip)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Alien's Super-fast Comms"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.tableHeaderView = headerView
        
        addCommentsRightBarButton(target: self, action: #selector(ObserverSampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: AnyObject) {
        self.pushCommentaryPage(behaviouralPatternType: .observer)
    }

    // MARK: - IBActions -
    
    @IBAction fileprivate func showMothershipMessageOption(_ sender: UIButton) {
        let alertController = createMessagesAlertController()
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction fileprivate func addAttackerShip(_ sender: UIButton) {
        let attackerShip = AlienAttackerShip()
        
        motherShip.addListener(attackerShip)
        attackerShips.append(attackerShip)
    }
    
    @IBAction fileprivate func addMaintainerShip(_ sender: UIButton) {
        let maintainerShip = AlienRepairShip()
        
        motherShip.addListener(maintainerShip)
        maintainerShips.append(maintainerShip)
    }
    
    // MARK: - Messages -
    
    fileprivate func createMessagesAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Mothership Messages", message: nil, preferredStyle: .actionSheet)
        
        let messages = [
            AlienMothershipMessage.Attack,
            AlienMothershipMessage.Retreat,
            AlienMothershipMessage.StayInPosition,
            AlienMothershipMessage.UnitsDown
        ]
        
        for message in messages {
            let alertAction = UIAlertAction(
                title: message.rawValue,
                style: .default,
                handler: {
                    [weak self] _ in
                    self?.motherShip.message = message
                    self?.mothershipMessageButton.setTitle(message.rawValue, for: UIControlState())
                    self?.tableView.reloadData()
            })
            
            alertController.addAction(alertAction)
        }
        
        return alertController
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ObserverSampleTableSection.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let validSection = ObserverSampleTableSection(rawValue: section) else {
            return nil
        }
        
        switch validSection {
        case .attackerAliens: return "Attacker Ships"
        case .maintainerAliens: return "Maintainer Ships"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let validSection = ObserverSampleTableSection(rawValue: section) else {
            return 0
        }
        
        switch validSection {
        case .attackerAliens: return attackerShips.count
        case .maintainerAliens: return maintainerShips.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: CGFloat(14))
        cell.textLabel?.text = ""
        
        guard let validSection = ObserverSampleTableSection(rawValue: indexPath.section) else {
            return cell
        }
        
        let mothershipListener: AlienMothershipListener
        var listenerIcon = ""
        
        switch validSection {
        case .attackerAliens:
            mothershipListener = attackerShips[indexPath.row]
            listenerIcon = "👾"
            
        case .maintainerAliens:
            mothershipListener = maintainerShips[indexPath.row]
            listenerIcon = "👽"
        }
        
        cell.textLabel?.text = "\(listenerIcon) #\(indexPath.row): \(mothershipListener.shipCurrentStatus())"
        
        return cell
    }
}
