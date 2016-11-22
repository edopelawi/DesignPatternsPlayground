//
//  PrototypeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/12/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

enum PrototypeSampleSection: Int {

    case prototype = 0
    case otherObjects = 1
    
    static func numberOfSections() -> Int {
        return 2
    }
}

class PrototypeSampleViewController: UITableViewController {

    @IBOutlet fileprivate var headerView: UIView!
    
    fileprivate let kNumberOfOtherMessengers = 5
    
    fileprivate var prototypeMessenger = Messenger(name: "Tegami Bachi", message: "Good news!")
    fileprivate var otherMessengers: [ Messenger ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messengers!"
        
        prepareTableView()
        prepareInitialMessengers()
        prepareCommentBarButton()
    }
    
    // MARK: - Private methods -
    
    fileprivate func prepareTableView() {
        tableView.tableHeaderView = headerView
        tableView.register(MessengerTableViewCell.nib(), forCellReuseIdentifier: MessengerTableViewCell.identifier)
    }
    
    fileprivate func prepareInitialMessengers() {
        replaceOtherMessengersWithPointers()
    }

    fileprivate func replaceOtherMessengersWithClones() {
        
        otherMessengers = []
        
        for _ in 1 ... kNumberOfOtherMessengers {
            otherMessengers.append(prototypeMessenger.copy() as! Messenger)
        }
        
        tableView.reloadData()
    }
    
    fileprivate func replaceOtherMessengersWithPointers() {
        
        otherMessengers = []
        
        for _ in 1 ... kNumberOfOtherMessengers {
            otherMessengers.append(prototypeMessenger)
        }
        
        tableView.reloadData()
    }
    
    fileprivate func prepareCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(PrototypeSampleViewController.pushCommentsPage(_:)))
    }
    
    @objc func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(creationalPatternType: .prototype)
    }
    
    // MARK: - IBActions -
    
    @IBAction func cloneButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let shouldClonePrototype = sender.isSelected
        
        if shouldClonePrototype {
            replaceOtherMessengersWithClones()
        } else {    
            replaceOtherMessengersWithPointers()
        }
       
    }
    
    @IBAction func mainViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return PrototypeSampleSection.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let prototypeSection = PrototypeSampleSection(rawValue: section) else {
            return 0
        }
        
        switch prototypeSection {
        case .prototype: return 1
        case .otherObjects: return otherMessengers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let prototypeSection = PrototypeSampleSection(rawValue: section) else {
            return nil
        }
        
        switch prototypeSection {
        case .prototype: return "Prototype Messenger"
        case .otherObjects: return "Other Messengers"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MessengerTableViewCell.preferredHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MessengerTableViewCell.identifier, for: indexPath) as! MessengerTableViewCell
        
        if let section = PrototypeSampleSection(rawValue: indexPath.section) {
            switch section {
            case .prototype: cell.configureForMessenger(prototypeMessenger)
            case .otherObjects: cell.configureForMessenger(otherMessengers[indexPath.row])
            }
        }
        
        return cell
    }
    
}
