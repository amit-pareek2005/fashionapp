//
//  Products.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//
import Foundation

struct Product: Identifiable {
    var id: String { productId }

    let productId: String
    let name: String
    let brand: String
    let category: String
    let subCategory: String
    let description: String
    let imageUrl: String
    let price: Double
    let currency: String
    let stockQuantity: Int
    let rating: Double
    let featured: Bool
    let tags: [String]
    let features: [String]
    let createdAt: String
    let updatedAt: String
    let discount: Discount
    let reviews: [Review]

    struct Discount {
        let active: Bool
        let percentage: Int
        let startDate: String?
        let endDate: String?
    }

    struct Review {
        let userId: String
        let rating: Int
        let comment: String
    }

    init?(from dict: [String: Any]) {
        guard
            let productId = dict["productId"] as? String,
            let name = dict["name"] as? String,
            let brand = dict["brand"] as? String,
            let category = dict["category"] as? String,
            let subCategory = dict["subCategory"] as? String,
            let description = dict["description"] as? String,
            let imageUrl = dict["imageUrl"] as? String,
            let price = dict["price"] as? Double,
            let currency = dict["currency"] as? String,
            let stockQuantity = dict["stockQuantity"] as? Int,
            let rating = dict["rating"] as? Double,
            let featured = dict["featured"] as? Bool,
            let tags = dict["tags"] as? [String],
            let features = dict["features"] as? [String],
            let createdAt = dict["createdAt"] as? String,
            let updatedAt = dict["updatedAt"] as? String,
            let discountDict = dict["discount"] as? [String: Any],
            let active = discountDict["active"] as? Bool,
            let percentage = discountDict["percentage"] as? Int
        else {
            return nil
        }

        let startDate = discountDict["startDate"] as? String
        let endDate = discountDict["endDate"] as? String
        self.discount = Discount(active: active, percentage: percentage, startDate: startDate, endDate: endDate)

        let reviewDictionaries = dict["reviews"] as? [[String: Any]] ?? []
        self.reviews = reviewDictionaries.compactMap { review in
            guard
                let userId = review["userId"] as? String,
                let rating = review["rating"] as? Int,
                let comment = review["comment"] as? String
            else { return nil }

            return Review(userId: userId, rating: rating, comment: comment)
        }

        self.productId = productId
        self.name = name
        self.brand = brand
        self.category = category
        self.subCategory = subCategory
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
        self.currency = currency
        self.stockQuantity = stockQuantity
        self.rating = rating
        self.featured = featured
        self.tags = tags
        self.features = features
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
