//
//  RealtimeProductService.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import FirebaseDatabase

class RealtimeProductService {
    private let dbRef = Database.database().reference()

    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        dbRef.child("products").observeSingleEvent(of: .value) { snapshot in
            var products: [Product] = []

            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                   let dict = snap.value as? [String: Any],
                   let product = Product(from: dict) {
                    products.append(product)
                }
            }

            completion(products)
        }
    }
}
