//
//  CartManager.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published var items: [Product] = []

    // Add product to cart
    func addToCart(product: Product) {
        items.append(product)
    }

    // Remove product from cart
    func removeFromCart(at index: Int) {
        items.remove(at: index)
    }

    // Get total items count
    func getCartCount() -> Int {
        return items.count
    }

    // Get total price of items in the cart
    func getTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}
