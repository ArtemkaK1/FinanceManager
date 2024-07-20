//
//  AccountService.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI
import FirebaseAuth

class AccountService {
    
    private init() {}
    
    static let shared = AccountService()
    
    func firebaseRegister(registerData: RegisterModel, completion: @escaping (AuthStatus) -> Void) {
        Auth.auth().createUser(withEmail: registerData.email, password: registerData.password) { authResult, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
                completion(.fail(error))
            } else {
                completion(.success)
            }
        }
    }
    
    func firebaseLogin(loginData: LoginModel, completion: @escaping (AuthStatus) -> Void) {
        Auth.auth().signIn(withEmail: loginData.email, password: loginData.password) { authResult, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                completion(.fail(error))
            } else {
                completion(.success)
            }
        }
    }
}
