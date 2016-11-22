//
//  FactoryMethodSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/30/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class FactoryMethodSampleViewController: UITableViewController {
    
    fileprivate var viewModels: [ ParadeViewModel ] = []
    fileprivate let reuseIdentifier = "reuseIdentifier"
    
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

    fileprivate func prepareCommentBarButton() {
        self.addCommentsRightBarButton(target: self, action: #selector(FactoryMethodSampleViewController.pushCommentsPage(_:)))
    }

    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        self.pushCommentaryPage(creationalPatternType: .factoryMethod)
    }
    
    fileprivate func prepareViewModels() {
        viewModels = [
            DesertParadeViewModel(),
            SeaParadeViewModel(),
            SkyParadeViewModel(),
            JungleParadeViewModel(),
            CityParadeViewModel(),
            BlackParadeViewModel()
        ]
    }
    
    fileprivate func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title = ""
        
        if section < viewModels.count {
            let viewModel = viewModels[section]
            title = viewModel.decoratedParadeName()
        }
        
        return title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = ""
        
        let section = indexPath.section
        
        if section < viewModels.count {
            let viewModel = viewModels[section]
            cell.textLabel?.text = viewModel.decoratedParadeMembers()
        }
        
        return cell
    }
    
}
