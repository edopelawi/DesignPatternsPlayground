//
//  MessengerTableViewCell.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/12/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class MessengerTableViewCell: UITableViewCell, UITextFieldDelegate, MessengerObserver {

    static let identifier = "MessengerCellIdentifier"
    static let preferredHeight = CGFloat(96)
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var messageTextField: UITextField!
    
    private var currentMessenger: Messenger? {
        didSet {
            if let validOldMessenger = oldValue {
                validOldMessenger.removeObserver(self)
            }
            
            currentMessenger?.addObserver(self)
        }
    }
    
    // MARK: Public methods
    
    internal func configureForMessenger(messenger: Messenger) {
        currentMessenger = messenger
    }
    
    // MARK: UITextField delegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        guard let messenger = currentMessenger else {
            return
        }
        
        guard let currentText = textField.text else {
            return
        }
        
        if textField == nameTextField {
            messenger.name = currentText
        } else {
            messenger.message = currentText
        }
    }
    
    // MARK: MessengerObserver methods
    
    func nameChanged(name: String) {
        nameTextField.text = name
    }
    
    func messageChanged(message: String) {
        messageTextField.text = message
    }
    
}
