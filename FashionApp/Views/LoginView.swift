import SwiftUI

struct LoginView: View {
   
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 16) {
        CommonHeader(title: "SoSoChic")
            
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
            Button("Sign In") {
                authVM.signIn(email: email, password: password)
            }
            Button("Register") {
                authVM.register(email: email, password: password)
            }
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
    }
}
