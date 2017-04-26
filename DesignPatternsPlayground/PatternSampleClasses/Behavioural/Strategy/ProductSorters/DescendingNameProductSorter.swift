//
//  DescendingNameProductSorter.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class DescendingNameProductSorter: ProductSorter {
    
    func sortProducts(_ products: [Product]) -> [Product] {
        return products.sorted { $0.name > $1.name }
    }
}
