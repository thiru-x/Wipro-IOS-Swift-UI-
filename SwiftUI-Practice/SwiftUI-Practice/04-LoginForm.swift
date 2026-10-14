import SwiftUI

struct LoginFormView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showMessage = false

    private var canLogin: Bool {
        email.contains("@") && password.count >= 6
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Account") {
                    TextField("Email address", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    SecureField("Password (6+ characters)", text: $password)
                }

                Section {
                    Button("Log In") {
                        showMessage = true
                    }
                    .disabled(!canLogin)
                }

                if showMessage {
                    Section("Status") {
                        Text("Practice login submitted for \(email).")
                            .foregroundStyle(.green)
                    }
                }
            }
            .navigationTitle("Login Form")
        }
    }
}

#Preview {
    LoginFormView()
}
