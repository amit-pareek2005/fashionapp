//
//  FeaturedProductView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import Foundation
import SwiftUI

struct FeaturedProductView: View {
    @State private var featuredProducts: [Product] = []

    var body: some View {
        VStack(alignment: .leading) {
            Text("✨ Featured Products")
                .font(.largeTitle)
                .bold()
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(featuredProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            VStack(alignment: .leading, spacing: 8) {
                                AsyncImage(url: URL(string: product.imageUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Rectangle()
                                        .foregroundColor(.gray.opacity(0.3))
                                }
                                .frame(width: 180, height: 220)
                                .clipped()
                                .cornerRadius(12)

                                Text(product.name)
                                    .font(.headline)

                                Text("$\(product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                            .frame(width: 180)
                            .padding(.vertical)
                        }
                        .buttonStyle(PlainButtonStyle()) // Prevents NavigationLink from affecting the UI appearance
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            RealtimeFeatureedProductService().fetchFeaturedProducts { products in
                self.featuredProducts = products
            }
        }
    }
}
