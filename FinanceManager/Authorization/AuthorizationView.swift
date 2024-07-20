//
//  AuthorizationView.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI

struct AuthorizationView: View {
    
    @State private var isNewUser: Bool = false
    
    var body: some View {
        if isNewUser {
            RegistrationView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    AuthorizationView()
}
