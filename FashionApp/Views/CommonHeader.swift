//
//  CommonHeader.swift
//  FashionApp
//
//  Created by Amit Pareek on 10/04/25.
//

import Foundation
import SwiftUI

struct CommonHeader: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 40)
            .padding(.bottom, 20)
    }
}
