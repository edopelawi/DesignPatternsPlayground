//
//  SingletonSampleViewController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class SingletonSampleViewController: UIViewController, UITextViewDelegate {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var diaryTextView: UITextView!
    
    @IBOutlet private weak var topSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var diary: Diary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Dear Diary."
        
        configureTopSpaceConstraint()
        activityIndicator.startAnimating()
        
        loadDiaryData()
        
    }
    
    private func configureTopSpaceConstraint() {
        if let navigationBarHeight = navigationController?.navigationBar.frame.height {
            let statusBarHeight = CGFloat(20)
            let topPadding = CGFloat(8)
            
            topSpaceConstraint.constant = navigationBarHeight + statusBarHeight + topPadding
        }
    }
    
    private func loadDiaryData() {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            [weak self] _ in

            self?.diary = Diary.sharedDiary
            
            dispatch_async(dispatch_get_main_queue(), {
                _ in
                
                self?.titleTextField.text = self?.diary.name
                self?.diaryTextView.text = self?.diary.diaryText
                self?.activityIndicator.stopAnimating()
            })
        }
        
    }
    
    // MARK: IBActions

    @IBAction func diaryTitleChanged(sender: UITextField) {
        
        if let diaryTitle = sender.text {
            diary.name = diaryTitle
        }
    }
    
    @IBAction func mainViewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: UITextView delegate
    
    func textViewDidChange(textView: UITextView) {        
        diary.diaryText = textView.text
    }
    
}
