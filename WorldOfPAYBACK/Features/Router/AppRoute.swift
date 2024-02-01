//
//  AppRoute.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

enum AppRoute: Hashable {
    case dashboard
    case transaction(transactionItem: Transaction)

    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.dashboard, .dashboard):
            return true
        case let (.transaction(lhsTransaction), .transaction(rhsTransaction)):
            return lhsTransaction == rhsTransaction
        default:
            return false
        }
    }
}
