//
//  LoginView.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var accountState: AccountState
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorAlert: Bool = false
    
    private let accountService: AccountService
    
    init() {
        self.accountService = AccountService.shared
    }
    
    var body: some View {
        VStack {
            Text("Login into your account")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: {
                let data = LoginModel(email: email, password: password)
                accountService.firebaseLogin(loginData: data) { result in
                    switch result {
                    case .success:
                        self.accountState.isLoggedIn = true
                    case .fail(let error):
                        self.showErrorAlert = true
                    }
                }
            }) {
                Text("Login")
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Login error"),
                  message: Text("Something went wront, please try again"),
                  dismissButton: .default(Text("OK")))
        }
        
    }
}

#Preview {
    LoginView()
}
