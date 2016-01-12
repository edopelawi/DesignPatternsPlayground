//
//  FactoryMethodSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FactoryMethodSampleViewController: UITableViewController {
    
    private var viewModels: [ ParadeViewModel ] = []
    private let reuseIdentifier = "reuseIdentifier"
    
    convenience init() {
        self.init(nibName: "FactoryMethodSampleViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Parades, Parades!"
        
        prepareCommentBarButton()
        
        prepareViewModels()
        registerCells()
    }

    private func prepareCommentBarButton() {
        self.addCommentsRightBarButton(target: self, action: Selector("pushCommentsPage:"))
    }

    @objc private func pushCommentsPage(sender: AnyObject) {
        self.pushCommentaryPage(creationalPatternType: .FactoryMethod)
    }
    
    private func prepareViewModels() {
        viewModels = [
            DesertParadeViewModel(),
            SeaParadeViewModel(),
            SkyParadeViewModel(),
            JungleParadeViewModel(),
            CityParadeViewModel(),
            BlackParadeViewModel()
        ]
    }
    
    private func registerCells() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewModels.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title = ""
        
        if section < viewModels.count {
            let viewModel = viewModels[section]
            title = viewModel.decoratedParadeName()
        }
        
        return title
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        cell.textLabel?.text = ""
        
        let section = indexPath.section
        
        if section < viewModels.count {
            let viewModel = viewModels[section]
            cell.textLabel?.text = viewModel.decoratedParadeMembers()
        }
        
        return cell
    }
    
}
