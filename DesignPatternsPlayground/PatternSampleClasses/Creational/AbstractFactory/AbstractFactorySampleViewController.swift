//
//  AbstractFactorySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class AbstractFactorySampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let cellIdentifier = "cellIdentifier"
    
    convenience init() {
        self.init(nibName: "AbstractFactorySampleViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chefs and Cuisines!"
        
        prepareTableView()
        prepareCommentBarButton()
    }
    
    
    @IBAction func randomizeFood(sender: AnyObject) {
        tableView.reloadData()
    }
    
    // MARK: - UITableView Data Source and Delegate -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodType.numberOfTypes()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		var cell: UITableViewCell
		
		if let dequeuedCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
			cell = dequeuedCell
		} else {
			cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
		}
		
        if let foodType = FoodType(rawValue: indexPath.row) {
        
            let foodTypeText = FoodType.stringForType(foodType)
			
			let academy = ChefAcademyAgency.getAcademyForFoodType(foodType)
            let chef = academy.createChef()
            let foodName = chef.cook().name
            
            cell.textLabel?.text = "\(chef.name)'s \(foodName)"
			cell.detailTextLabel?.text = foodTypeText
        }
        
        return cell
    }
    
    // MARK: - Private methods -
    
    private func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self        
    }

    private func prepareCommentBarButton() {
        addCommentsRightBarButton(target: self, action: Selector("pushCommentPage:"))
    }
    
    @objc private func pushCommentPage(sender: UIBarButtonItem) {        
        pushCommentaryPage(creationalPatternType: .AbstractFactory)
    }
}
