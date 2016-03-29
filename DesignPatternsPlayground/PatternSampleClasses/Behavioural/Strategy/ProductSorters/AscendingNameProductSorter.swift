//
//  AscendingNameProductSorter.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class AscendingNameProductSorter: ProductSorter {
    
    func sortProducts(products: [Product]) -> [Product] {
        
        return products.sort{ $0.name < $1.name }
    }
}