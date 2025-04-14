//
//  CheckoutView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager

    @State private var name: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var zipCode: String = ""
    @State private var isOrderPlaced: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Shipping Information")) {
                TextField("Full Name", text: $name)
                TextField("Address", text: $address)
                TextField("City", text: $city)
                TextField("ZIP Code", text: $zipCode)
                    .keyboardType(.numberPad)
            }

            Section(header: Text("Cart Summary")) {
                ForEach(cartManager.items.indices, id: \.self) { index in
                    let item = cartManager.items[index]
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")")
                    }
                }

                HStack {
                    Text("Total")
                        .fontWeight(.bold)
                    Spacer()
                    Text("$\(cartManager.getTotalPrice(), specifier: "%.2f")")
                        .fontWeight(.bold)
                }
            }

            Button(action: {
                placeOrder()
            }) {
                Text("Place Order")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Checkout")
        .alert(isPresented: $isOrderPlaced) {
            Alert(
                title: Text("Thank you!"),
                message: Text("Your order has been placed successfully."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func placeOrder() {
        // Simulate order placement
        guard !name.isEmpty && !address.isEmpty && !city.isEmpty && !zipCode.isEmpty else { return }
        isOrderPlaced = true
        cartManager.items.removeAll()
    }
}
