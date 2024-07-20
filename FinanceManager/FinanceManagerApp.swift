//
//  FinanceManagerApp.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI

@main
struct FinanceManagerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var accountState: AccountState
    
    init() {
        let wrapper = AccountState()
        _accountState = StateObject(wrappedValue: wrapper)
    }
    
    var body: some Scene {
        WindowGroup {
            if accountState.isLoggedIn {
                MainView()
                    .environmentObject(accountState)
            } else {
                RegistrationView()
                    .environmentObject(accountState)
            }
        }
    }
}
