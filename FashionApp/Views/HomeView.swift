
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject private var cartManager = CartManager()

    var body: some View {
        VStack(spacing: 16) {
            CommonHeader(title: "Home")

            Text("You're signed in.")
            FeaturedProductView()
            Button("") {
                Task {
                    try await APIService.shared.callExample()
                }
            }
        }
        .padding()
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        // Search Button
                        NavigationLink(destination: ProductListView().environmentObject(cartManager)) {
                            Image(systemName: "magnifyingglass")
                        }

                        // Sign Out Button
                        NavigationLink(destination: SignOutView()) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }

    }
}
    
