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
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        if let foodType = FoodType(rawValue: indexPath.row) {
        
            let foodTypeText = FoodType.stringForType(foodType)
            
            let chef = AbstractChefFactory.chefForFoodType(foodType)
            let foodName = chef.cook().name
            
            cell.textLabel?.text = "\(foodTypeText): \(foodName)"
        }
        
        return cell
    }
    
    // MARK: - Private methods -
    
    private func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    private func prepareCommentBarButton() {
        let button = UIBarButtonItem(
            title: "Comments",
            style: .Plain,
            target: self,
            action: Selector("pushCommentPage:")
        )
        
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func pushCommentPage(sender: UIBarButtonItem) {

        // TODO: Update loaded commentary here
        
        let commentaries = PatternCommentaryFactory.commentaryForCreationalPattern(.AbstractFactory)
        
        let commentPage = CommentaryViewController()
        commentPage.setCommentaryText(commentaries);
        
        self.navigationController?.pushViewController(commentPage, animated: true)
    }
}
