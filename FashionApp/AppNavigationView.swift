import SwiftUI

struct AppNavigationView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        NavigationStack {
            if authViewModel.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}