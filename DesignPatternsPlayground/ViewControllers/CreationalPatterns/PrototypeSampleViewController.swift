//
//  PrototypeSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/12/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

enum PrototypeSampleSection: Int {

    case Prototype = 0
    case OtherObjects = 1
    
    static func numberOfSections() -> Int {
        return 2
    }
}

class PrototypeSampleViewController: UITableViewController {

    @IBOutlet private var headerView: UIView!
    
    private let kNumberOfOtherMessengers = 5
    
    private var prototypeMessenger = Messenger(name: "Tegami Bachi", message: "Good news!")
    private var otherMessengers: [ Messenger ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messengers!"
        
        prepareTableView()
        prepareInitialMessengers()
        prepareCommentBarButton()
    }
    
    // MARK: - Private methods -
    
    private func prepareTableView() {
        tableView.tableHeaderView = headerView
        tableView.registerNib(MessengerTableViewCell.nib(), forCellReuseIdentifier: MessengerTableViewCell.identifier)
    }
    
    private func prepareInitialMessengers() {
        replaceOtherMessengersWithPointers()
    }

    private func replaceOtherMessengersWithClones() {
        
        otherMessengers = []
        
        for _ in 1 ... kNumberOfOtherMessengers {
            otherMessengers.append(prototypeMessenger.copy() as! Messenger)
        }
        
        tableView.reloadData()
    }
    
    private func replaceOtherMessengersWithPointers() {
        
        otherMessengers = []
        
        for _ in 1 ... kNumberOfOtherMessengers {
            otherMessengers.append(prototypeMessenger)
        }
        
        tableView.reloadData()
    }
    
    private func prepareCommentBarButton() {
        addCommentsRightBarButton(target: self, action: Selector("pushCommentsPage:"))
    }
    
    @objc func pushCommentsPage(sender: AnyObject) {
        pushCommentaryPage(creationalPatternType: .Prototype)
    }
    
    // MARK: - IBActions -
    
    @IBAction func cloneButtonTapped(sender: UIButton) {
        sender.selected = !sender.selected
        
        let shouldClonePrototype = sender.selected
        
        if shouldClonePrototype {
            replaceOtherMessengersWithClones()
        } else {    
            replaceOtherMessengersWithPointers()
        }
       
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return PrototypeSampleSection.numberOfSections()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let prototypeSection = PrototypeSampleSection(rawValue: section) else {
            return 0
        }
        
        switch prototypeSection {
        case .Prototype: return 1
        case .OtherObjects: return otherMessengers.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let prototypeSection = PrototypeSampleSection(rawValue: section) else {
            return nil
        }
        
        switch prototypeSection {
        case .Prototype: return "Prototype Messenger"
        case .OtherObjects: return "Other Messengers"
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return MessengerTableViewCell.preferredHeight
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(MessengerTableViewCell.identifier, forIndexPath: indexPath) as! MessengerTableViewCell
        
        if let section = PrototypeSampleSection(rawValue: indexPath.section) {
            switch section {
            case .Prototype: cell.configureForMessenger(prototypeMessenger)
            case .OtherObjects: cell.configureForMessenger(otherMessengers[indexPath.row])
            }
        }
        
        return cell
    }
    
}
