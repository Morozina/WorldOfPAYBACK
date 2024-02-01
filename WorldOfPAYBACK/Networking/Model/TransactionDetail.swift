//
//  TransactionDetail.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct TransactionDetail: Codable, Hashable {
    let description: String?
    let bookingDate: String
    let value: Value

    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
        hasher.combine(bookingDate)
        hasher.combine(value)
    }
}
