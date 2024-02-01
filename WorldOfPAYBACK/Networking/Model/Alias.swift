//
//  Alias.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

struct Alias: Codable, Hashable {
    let reference: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(reference)
    }
}
