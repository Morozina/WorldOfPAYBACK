//
//  IdentifiableTransaction.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct IdentifiableTransaction: Codable {
    var id: Int
    let transaction: Transaction
    
    init(id: Int, transaction: Transaction) {
        self.id = id
        self.transaction = Transaction(
            partnerDisplayName: transaction.partnerDisplayName,
            alias: transaction.alias,
            category: transaction.category,
            transactionDetail: TransactionDetail(
                description: transaction.transactionDetail.description,
                bookingDate: DateHelper.dateStringWithFormat(
                    date: transaction.transactionDetail.bookingDate,
                    formatType: .userFriendly),
                value: transaction.transactionDetail.value
            )
        )
    }
}
