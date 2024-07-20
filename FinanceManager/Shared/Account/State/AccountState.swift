//
//  AccountState.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import Foundation

class AccountState: ObservableObject {
    
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "is_logged_in")
        }
    }
    
    @Published var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "user_name")

        }
    }
    
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "user_email")
        }
    }
    
    init() {
        self.isLoggedIn = UserDefaults.standard.value(forKey: "is_logged_in") as? Bool ?? false
        self.name = UserDefaults.standard.value(forKey: "user_name") as? String ?? "Unknown"
        self.email = UserDefaults.standard.value(forKey: "user_email") as? String ?? "Unknown"
    }
}
