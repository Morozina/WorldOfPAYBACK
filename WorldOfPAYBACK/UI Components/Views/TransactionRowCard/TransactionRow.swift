//
//  TransactionRow.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

import SwiftUI

struct TransactionsRawView: View {
    let transaction: Transaction

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Text(transaction.partnerDisplayName)
                    .font(Theme.Fonts.boldl18)
                    .foregroundColor(.black)
                    .lineLimit(Theme.Constants.lineLimitTwo)
                    .frame(alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text(transaction.transactionDetail.description ?? "")
                    .font(Theme.Fonts.normal12)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: .zero) {
                Text(transaction.transactionDetail.bookingDate)
                    .font(Theme.Fonts.boldl16)
                    .foregroundColor(Color(Theme.Colors.textBlue))
                    .lineLimit(Theme.Constants.lineLimitOne)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    .fixedSize(horizontal: true, vertical: false)
                Spacer()
                HStack(spacing: Theme.Dimensions.defaultLayoutMargin) {
                    Text(String(transaction.transactionDetail.value.amount))
                        .font(Theme.Fonts.boldl18)
                        .foregroundColor(Color(Theme.Colors.red))
                        .lineLimit(Theme.Constants.lineLimitOne)
                    Text(transaction.transactionDetail.value.currency)
                        .font(Theme.Fonts.boldl16)
                        .foregroundColor(.black)
                        .lineLimit(Theme.Constants.lineLimitOne)
                }
            }
        }
        .modifier(RowCard())
    }
}

#Preview {
    TransactionsRawView(transaction: Transaction(partnerDisplayName: "123", alias: Alias(reference: "alias"), category: 0, transactionDetail: TransactionDetail(description: "asbsadasdas", bookingDate: "456", value: Value(amount: 123, currency: "PBP"))))
}
