//
//  ProductSorter.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol ProductSorter {
    
    /**
     Returns sorted result from passed array of `Product`
     
     - parameter products: array of `Product` instances.
     
     - returns: array of sorted `Product` instances.
     */
    func sortProducts(products: [Product]) -> [Product]
}