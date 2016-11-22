//
//  ProxySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/26/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class ProxySampleViewController: UIViewController {

    @IBOutlet fileprivate weak var minimumHeightLabel: UILabel!
    @IBOutlet fileprivate weak var responseLabel: UILabel!
    
    @IBOutlet fileprivate weak var scrollView: UIScrollView!
    
    fileprivate var initialScrollViewInset: UIEdgeInsets?
    fileprivate var initialScrollViewIndicatorInset: UIEdgeInsets?
    
    fileprivate var ticketSalesPerson = ThemeParkTicketSalesPerson()
    fileprivate var visitor = ThemeParkVisitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Theme Park!"
        
        minimumHeightLabel.text = "Very well, but you must be \(ticketSalesPerson.minimumVisitorHeight) cm tall or more to enter the park. What's your height?"
        updateResponseLabel()
        configureCommentBarButton()
    }
    
    // IBActions
    @IBAction func visitorHeightChanged(_ sender: UITextField) {
        if let textInput = sender.text,
           let validHeight = Int(textInput) {
            
            visitor.height = validHeight
            updateResponseLabel()
        }
    }
    
    // MARK: Private methods
    
    fileprivate func configureCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(ProxySampleViewController.pushCommentsPage(_:)))
    }
    
    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .proxy)
    }
    
    fileprivate func updateResponseLabel() {

        let ticketCode = ticketSalesPerson.retrieveTicketForVisitor(visitor)
        
        var responseString: String
        
        if ticketCode == "" {
            responseString = "My apologies son, but you're not tall enough to enter the park. Come again next year, will you?"
        } else {
            responseString = "Here's your ticket! 🎫 The code is \(ticketCode). Don't forget to show this to take the ride!"
        }
        
        responseLabel.text = responseString
    }

}
