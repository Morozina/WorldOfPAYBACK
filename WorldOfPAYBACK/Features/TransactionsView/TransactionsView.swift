//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationView(title: "Transactions", onBackAction: router.pop)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Spacer()
    }
}

#Preview {
    TransactionsView()
}
