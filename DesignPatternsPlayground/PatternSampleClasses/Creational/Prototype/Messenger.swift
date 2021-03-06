//
//  Messenger.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/12/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

/// Observer of a `Messenger` instance.
protocol MessengerObserver: AnyObject {
    
    // NOTE: Observer pattern is chosen here (instead of the normal Delegate) so an instance
    // could have more than one listener. This will be used as validation whether a `Messenger`
    // instance is a clone or not.
    
    /// This method will be called if corresponding `Messenger` instance's name is changed.
    func messenger(_ messenger: Messenger, nameChanged name: String)
    
    /// This method will be called if corresponding `Messenger` instance's message is changed.
    func messenger(_ messenger: Messenger, messageChanged message: String)
}

class Messenger: NSObject, NSCopying {
    
    internal var name: String {
        didSet {
            for observer in observers {
                observer.messenger(self, nameChanged: name)
            }
        }
    }
    
    internal var message: String {
        didSet {
            for observer in observers {
                observer.messenger(self, messageChanged: message)
            }
        }
    }
    
    /// Observers of this instance. Copying this instance won't copy the observers.
    fileprivate var observers: [ MessengerObserver ]
    
    required init(name: String, message: String){
        self.name = name
        self.message = message
        self.observers = []
    }
    
    /// Adds passed `MessengerObserver` as this instance's observer. Nothing will happen if it's already in the list of observers.
    internal func addObserver(_ newObserver: MessengerObserver) {
        if observers.contains(where: { Unmanaged<AnyObject>.passUnretained($0).toOpaque() == Unmanaged<AnyObject>.passUnretained(newObserver).toOpaque() }) {
            return
        }
        
        observers.append(newObserver)
    }
    
    /// Removes passed `MessengerObserver` as this instance's observer.  Nothing will happen if it's not in the list of observers.
    internal func removeObserver(_ oldObserver: MessengerObserver) {
        if let observerIndex = observers.index(where: { $0 === oldObserver }) {
            observers.remove(at: observerIndex)
        }
    }
    
    // MARK: NSCopying
    
    func copy(with zone: NSZone?) -> Any {
        return Messenger(name: self.name, message: self.message)
    }
}
