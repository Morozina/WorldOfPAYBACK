//
//  Value.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct Value: Codable, Hashable {
    let amount: Int
    let currency: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(currency)
    }
}
