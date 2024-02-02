//
//  MainView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct MainView: View {
    // MARK: - Router
    @StateObject var router = Router(root: .dashboard)

    var body: some View {
        RouterView(router: router) { path in
            switch path {
            case .dashboard:
                DashboardView(viewModel: DashboardViewModel())
            case .transaction(let transaction):
                TransactionsView(transaction: transaction)
            }
        }
    }
}

#Preview {
    MainView()
}
