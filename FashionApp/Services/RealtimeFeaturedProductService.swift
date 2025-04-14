//
//  RealtimeFeaturedProductService.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import FirebaseDatabase

class RealtimeFeatureedProductService {
    private let dbRef = Database.database().reference()

    func fetchFeaturedProducts(completion: @escaping ([Product]) -> Void) {
        dbRef.child("products").observeSingleEvent(of: .value) { snapshot in
            var featured: [Product] = []
            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                   let dict = snap.value as? [String: Any],
                   let product = Product(from: dict),
                   product.featured {
                    featured.append(product)
                }
            }

            completion(featured)
        }
    }
}
