//
//  PatternTypeTableController.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/13/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

enum PatternTypeTableControllerGroupType {
    case Creational
    case Structural
}

class PatternTypeTableController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView
    private var patternGroupType: PatternTypeTableControllerGroupType
    
    private let cellReuseIdentifier = "PatternCellIdentifier"
    
    /// Executed when a `PatternType` is selected.
    internal var patternTypeSelectedClosure: ((PatternType) -> Void)?
    
    required init(tableView: UITableView, patternGroupType: PatternTypeTableControllerGroupType) {
        
        self.tableView = tableView
        self.patternGroupType = patternGroupType
        
        super.init()
        
        configureCurrentTableView()
    }
    
    private func configureCurrentTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    private func patternTypeForRow(row: Int) -> PatternType? {
        switch patternGroupType {
        case .Creational: return CreationalPatternType(rawValue: row)
        case .Structural: return StructuralPatternType(rawValue: row)
        }
    }
    
    private func configureCell(cell: UITableViewCell, forRow row: Int) {
        
        var text = ""
        
        if let typeName = patternTypeForRow(row)?.toString() {
            text = typeName
        }
        
        cell.textLabel?.text = text
        
        cell.backgroundColor = tableView.backgroundColor
        cell.accessoryType = .DisclosureIndicator
        
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    // MARK: - UITableView Delegate and Datasource -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch patternGroupType {
        case .Creational: return CreationalPatternType.numberOfTypes()
        case .Structural: return StructuralPatternType.numberOfTypes()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        self.configureCell(cell, forRow: indexPath.row)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let patternSelectedClosure = patternTypeSelectedClosure else {
            return
        }
        
        var optionalType: PatternType?
        
        switch patternGroupType {
        case .Creational: optionalType = CreationalPatternType(rawValue: indexPath.row)
        case .Structural: optionalType = StructuralPatternType(rawValue: indexPath.row)
        }
        
        if let selectedType = optionalType {
            patternSelectedClosure(selectedType)
        }        
    }
    
}