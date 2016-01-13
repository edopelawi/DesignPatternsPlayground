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
    
    private let diary = Diary.sharedDiary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = diary.name
        diaryTextView.text = diary.diaryText
    }
    
    // MARK: IBActions

    @IBAction func diaryTitleChanged(sender: UITextField) {
        
        if let diaryTitle = sender.text {
            diary.name = diaryTitle
        }
    }
    
    
    // MARK: UITextView delegate
    
    func textViewDidChange(textView: UITextView) {        
        diary.diaryText = textView.text
    }
    
}
