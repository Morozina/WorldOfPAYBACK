//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct TransactionsView: View {
    // MARK: - Router
    @EnvironmentObject var router: Router

    // MARK: - Dependencies
    let transaction: Transaction

    var body: some View {
        VStack(spacing: .zero) {
            NavigationView(title: "Transaction-List-Title".localized, onBackAction: router.pop)
            Spacer()
            VStack(spacing: .zero) {
                Text(transaction.partnerDisplayName)
                    .font(Theme.Fonts.boldl18)
                    .lineLimit(Theme.Constants.lineLimitOne)
                Text(transaction.transactionDetail.description ?? "")
                    .modifier((transaction.transactionDetail.description != nil) ?
                              DescriptionCard(color: .cyan) :
                                DescriptionCard(color: .white.opacity(Theme.Constants.smallLayoutOpacity)))
            }
            Spacer()
        }
    }
}

#Preview {
    TransactionsView(transaction: Transaction(partnerDisplayName: "123", alias: Alias(reference: "alias"), category: 0, transactionDetail: TransactionDetail(description: "asbsadasdas", bookingDate: "456", value: Value(amount: 123, currency: "PBP"))))
}
