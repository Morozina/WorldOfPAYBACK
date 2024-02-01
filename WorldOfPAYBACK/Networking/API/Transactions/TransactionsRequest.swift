//
//  TransactionsRequest.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

enum TransactionsRequest: RequestProtocol {
    case getTransactions

    var path: String {
        "/v2/transactions"
    }

    var urlParams: [String: String?] {
        switch self {
        case .getTransactions:
            return [:]
        }
    }

    var requestType: RequestType {
        .GET
    }
}
