//
//  SearchView.swift
//  FashionApp
//
//  Created by Amit Pareek on 13/04/25.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Add your filtered results here
            Spacer()
        }
        .navigationTitle("Search")
    }
}

#Preview {
    SearchView()
}
