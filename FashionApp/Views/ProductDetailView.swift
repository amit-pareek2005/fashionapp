//
//  ProductDetailView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    @State private var showCartAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: product.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 300)
                        .cornerRadius(12)
                        .overlay(
                            ProgressView()
                        )
                }

                Text(product.name)
                    .font(.title)
                    .bold()

                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)

                Text("Category: \(product.category)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(product.description)
                    .font(.body)

                // "Buy Now" and "Add to Cart" buttons
                HStack {
                    Button(action: {
                        // Add to Cart
                        cartManager.addToCart(product: product)
                        showCartAlert = true
                    }) {
                        Text("Buy Now")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $showCartAlert) {
                        Alert(title: Text("Item Added to Cart"), message: Text("You have added \(product.name) to your cart"), dismissButton: .default(Text("OK")))
                    }

                    Button(action: {
                        // Add to Cart
                        cartManager.addToCart(product: product)
                    }) {
                        Text("Add to Cart (\(cartManager.getCartCount()))")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
