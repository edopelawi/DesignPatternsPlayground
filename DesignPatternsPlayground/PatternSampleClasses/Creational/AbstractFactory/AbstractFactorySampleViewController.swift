//
//  AbstractFactorySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 12/28/15.
//  Copyright © 2015 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class AbstractFactorySampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate let cellIdentifier = "cellIdentifier"
    
    convenience init() {
        self.init(nibName: "AbstractFactorySampleViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chefs and Cuisines!"
        
        prepareTableView()
        prepareCommentBarButton()
    }
    
    
    @IBAction func randomizeFood(_ sender: AnyObject) {
        tableView.reloadData()
    }
    
    // MARK: - UITableView Data Source and Delegate -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodType.numberOfTypes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell: UITableViewCell
		
		if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
			cell = dequeuedCell
		} else {
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
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
    
    fileprivate func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self        
    }

    fileprivate func prepareCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(AbstractFactorySampleViewController.pushCommentPage(_:)))
    }
    
    @objc fileprivate func pushCommentPage(_ sender: UIBarButtonItem) {        
        pushCommentaryPage(creationalPatternType: .abstractFactory)
    }
}
