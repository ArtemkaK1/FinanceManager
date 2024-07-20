//
//  MainView.swift
//  FinanceManager
//
//  Created by Artemiy Kirillov on 20.07.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var accountState: AccountState

    var body: some View {
        VStack {
            Text(accountState.name)
            Text(accountState.email)
        }
    }
}

#Preview {
    MainView()
}
