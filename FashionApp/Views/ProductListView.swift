//
//  ProductListView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    @State private var products: [Product] = []
    @State private var searchText: String = ""
    @EnvironmentObject var cartManager: CartManager

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack {
            TextField("Search products...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            List(filteredProducts) { product in
                NavigationLink(destination: ProductDetailView(product: product).environmentObject(cartManager)) {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(.headline)
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .onAppear {
            RealtimeProductService().fetchProducts { fetched in
                self.products = fetched
            }
        }
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CartView().environmentObject(cartManager)) {
                    HStack {
                        Image(systemName: "cart")
                        Text("\(cartManager.getCartCount())")
                    }
                }
            }
        }
    }
}
