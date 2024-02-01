//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct Transaction: Codable, Hashable, Equatable{
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail

    func hash(into hasher: inout Hasher) {
        hasher.combine(partnerDisplayName)
        hasher.combine(alias)
        hasher.combine(category)
        hasher.combine(transactionDetail)
    }
}
