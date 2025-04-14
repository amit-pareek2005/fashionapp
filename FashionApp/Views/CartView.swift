//
//  CartView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack {
            if cartManager.items.isEmpty {
                Text("Your cart is empty.")
                    .font(.headline)
                    .padding()
            } else {
                List {
                    ForEach(cartManager.items.indices, id: \.self) { index in
                        HStack {
                            Text(cartManager.items[index].name)
                            Spacer()
                            Text("$\(cartManager.items[index].price, specifier: "%.2f")")
                        }
                        .onTapGesture {
                            // Remove item from cart
                            cartManager.removeFromCart(at: index)
                        }
                    }
                    .onDelete { indices in
                        for index in indices {
                            cartManager.removeFromCart(at: index)
                        }
                    }
                }
                
                HStack {
                    Text("Total: $\(cartManager.getTotalPrice(), specifier: "%.2f")")
                        .font(.title2)
                    Spacer()
                    Button(action: {
                        // Handle Checkout
                        print("Proceeding to checkout...")
                    }) {
                        NavigationLink(destination: CheckoutView().environmentObject(cartManager)) {
                            Text("Checkout")
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
    }
}
