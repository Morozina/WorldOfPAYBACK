//
//  TransactionsFetcherMock.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

protocol TransactionsFetcher {
    func fetchTransactions() async -> [Transaction]
}

struct TransactionsFetcherMock: TransactionsFetcher {
    func fetchTransactions() async -> [Transaction] {
        let seconds = Int.random(in: 1...2)
        let duration = UInt64(seconds * 1_000_000_000)

        do {
            try await Task.sleep(nanoseconds: duration)

            return Transaction.mock
        } catch {
            switch error as? NetworkError {
            case .invalidServerResponse, .invalidURL, .none:
                return []
            }
        }
    }
}
