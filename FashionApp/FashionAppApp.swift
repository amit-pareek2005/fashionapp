//
//  FashionAppApp.swift
//  FashionApp
//
//  Created by Amit Pareek on 10/04/25.
//

import SwiftUI
import Firebase

@main
struct FashionAppApp: App {
    @StateObject private var cartManager = CartManager()
    
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(cartManager)
        }
    }
}
