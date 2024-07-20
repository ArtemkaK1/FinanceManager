//
//  RegistrationView.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    
    @EnvironmentObject var accountState: AccountState
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorAlert: Bool = false
    
    private let accountService: AccountService
    
    init() {
        self.accountService = AccountService.shared
    }
    
    var body: some View {
        VStack {
            Text("Let's create an account")
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: {
                let data = RegisterModel(name: name, email: email, password: password)
                accountService.firebaseRegister(registerData: data) { result in
                    switch result {
                    case .success:
                        updateAccountState(name: name, email: email)
                    case .fail(let error):
                        self.showErrorAlert = true
                    }
                }
            }) {
                Text("Create account")
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Registration error"),
                      message: Text("Something went wront, please try again"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func updateAccountState(name: String, email: String) {
        self.accountState.isLoggedIn = true
        self.accountState.name = name
        self.accountState.email = email
    }
}

#Preview {
    RegistrationView()
}
