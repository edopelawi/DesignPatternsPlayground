//
//  PatternTypeTableController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

enum PatternTypeTableControllerGroupType {
    case creational
    case structural
    case behavioural
}

class PatternTypeTableController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    fileprivate var tableView: UITableView
    fileprivate var patternGroupType: PatternTypeTableControllerGroupType
    
    fileprivate let cellReuseIdentifier = "PatternCellIdentifier"
    
    /// Executed when a `PatternType` is selected.
    internal var patternTypeSelectedClosure: ((PatternType) -> Void)?
    
    required init(tableView: UITableView, patternGroupType: PatternTypeTableControllerGroupType) {
        
        self.tableView = tableView
        self.patternGroupType = patternGroupType
        
        super.init()
        
        configureCurrentTableView()
    }
    
    fileprivate func configureCurrentTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    fileprivate func patternTypeForRow(_ row: Int) -> PatternType? {
        switch patternGroupType {
        case .creational: return CreationalPatternType(rawValue: row)
        case .structural: return StructuralPatternType(rawValue: row)
        case .behavioural: return BehaviouralPatternType(rawValue: row)
        }
    }
    
    fileprivate func configureCell(_ cell: UITableViewCell, forRow row: Int) {
        
        var text = ""
        
        if let typeName = patternTypeForRow(row)?.toString() {
            text = typeName
        }
        
        cell.textLabel?.text = text
        
        cell.backgroundColor = tableView.backgroundColor
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.textColor = UIColor.white
    }
    
    // MARK: - UITableView Delegate and Datasource -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch patternGroupType {
        case .creational: return CreationalPatternType.numberOfTypes()
        case .structural: return StructuralPatternType.numberOfTypes()
        case .behavioural: return BehaviouralPatternType.numberOfTypes()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        self.configureCell(cell, forRow: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let patternSelectedClosure = patternTypeSelectedClosure else {
            return
        }
        
        if let selectedType = patternTypeForRow(indexPath.row) {
            patternSelectedClosure(selectedType)
        }        
    }
    
}
