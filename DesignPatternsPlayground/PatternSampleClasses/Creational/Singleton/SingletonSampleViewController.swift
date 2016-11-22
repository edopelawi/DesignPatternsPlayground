//
//  SingletonSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class SingletonSampleViewController: UIViewController, UITextViewDelegate {

    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var diaryTextView: UITextView!
    
    @IBOutlet fileprivate weak var topSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    fileprivate var diary: Diary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Dear Diary."
        
        configureCommentBarButton()
        configureTopSpaceConstraint()
        
        activityIndicator.startAnimating()
        
        loadDiaryData()
        
    }
    
    fileprivate func configureCommentBarButton() {
        addCommentsRightBarButton(target: self, action: #selector(SingletonSampleViewController.pushCommentsPage(_:)))
    }
    
    @objc fileprivate func pushCommentsPage(_ sender: AnyObject) {
        pushCommentaryPage(creationalPatternType: .singleton)
    }
    
    fileprivate func configureTopSpaceConstraint() {
        if let navigationBarHeight = navigationController?.navigationBar.frame.height {
            let statusBarHeight = CGFloat(20)
            let topPadding = CGFloat(8)
            
            topSpaceConstraint.constant = navigationBarHeight + statusBarHeight + topPadding
        }
    }
    
    fileprivate func loadDiaryData() {
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async {
            [weak self] _ in

            self?.diary = Diary.sharedDiary
            
            DispatchQueue.main.async(execute: {
                _ in
                
                self?.titleTextField.text = self?.diary.name
                self?.diaryTextView.text = self?.diary.diaryText
                self?.activityIndicator.stopAnimating()
            })
        }
        
    }
    
    // MARK: IBActions

    @IBAction func diaryTitleChanged(_ sender: UITextField) {
        
        if let diaryTitle = sender.text {
            diary.name = diaryTitle
        }
    }
    
    @IBAction func mainViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: UITextView delegate
    
    func textViewDidChange(_ textView: UITextView) {        
        diary.diaryText = textView.text
    }
    
}
