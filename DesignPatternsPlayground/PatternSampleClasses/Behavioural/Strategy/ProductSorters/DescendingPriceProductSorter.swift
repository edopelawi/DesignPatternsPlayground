//
//  DescendingPriceProductSorter.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 3/29/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

class DescendingPriceProductSorter: ProductSorter {
    func sortProducts(products: [Product]) -> [Product] {
        return products.sort { $0.price > $1.price }
    }
}