import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = Auth.auth().currentUser != nil

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            DispatchQueue.main.async {
                self.isLoggedIn = error == nil
            }
        }
    }

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            DispatchQueue.main.async {
                self.isLoggedIn = error == nil
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        isLoggedIn = false
    }
}