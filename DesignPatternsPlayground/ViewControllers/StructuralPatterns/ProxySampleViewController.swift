//
//  ProxySampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/26/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class ProxySampleViewController: UIViewController {

    @IBOutlet private weak var minimumHeightLabel: UILabel!
    @IBOutlet private weak var responseLabel: UILabel!
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var initialScrollViewInset: UIEdgeInsets?
    private var initialScrollViewIndicatorInset: UIEdgeInsets?
    
    private var ticketSalesPerson = ThemeParkTicketSalesPerson()
    private var visitor = ThemeParkVisitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Theme Park!"
        
        minimumHeightLabel.text = "Very well, but you must be \(ticketSalesPerson.minimumVisitorHeight) cm tall or more to enter the park. What's your height?"
        updateResponseLabel()
        configureCommentBarButton()
    }
    
    // IBActions
    @IBAction func visitorHeightChanged(sender: UITextField) {
        if let textInput = sender.text,
           let validHeight = Int(textInput) {
            
            visitor.height = validHeight
            updateResponseLabel()
        }
    }
    
    // MARK: Private methods
    
    private func configureCommentBarButton() {
        addCommentsRightBarButton(target: self, action: Selector("pushCommentsPage:"))
    }
    
    @objc private func pushCommentsPage(sender: AnyObject) {
        pushCommentaryPage(structuralPatternType: .Proxy)
    }
    
    private func updateResponseLabel() {

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
