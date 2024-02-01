//
//  TransactionDetail.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct TransactionDetail: Codable {
    let description: String?
    let bookingDate: String
    let value: Value
}
