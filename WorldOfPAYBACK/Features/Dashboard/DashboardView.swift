//
//  DashboardView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Filter") {
            router.push(to: .filter)
        }

        Button("Transactions") {
            router.push(to: .transaction)
        }
    }
}

#Preview {
    DashboardView()
}
