//
//  ProductList.swift
//  ShoppingList
//
//  Created by Diplomado on 12/10/24.
//

import Foundation
import UIKit

func loadProducts() -> [(UIImage?, String)] {
    var products: [(UIImage?, String)] = []

    for x in 1...10 {
        let imageName = "item \(x)" // Ensure your asset names match
        products.append((UIImage(named: imageName), "Item \(x)"))
    }

    return products
}

// Call the function to load products
let products = loadProducts()
