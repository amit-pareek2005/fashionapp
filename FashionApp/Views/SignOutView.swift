//
//  SignOutView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SignOutView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Are you sure you want to sign out?")
                .font(.title3)
                .padding()

            Button("Sign Out") {
                do {
                    try Auth.auth().signOut()
                    // Dismiss to login or root view after sign out
                } catch {
                    print("Error signing out: \(error.localizedDescription)")
                }
            }
            .foregroundColor(.red)

            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Sign Out")
    }
}

#Preview {
    SignOutView()
}
