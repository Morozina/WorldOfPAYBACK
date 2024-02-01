//
//  FetchTransactionService.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

actor FetchTransactionService {
    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

// MARK: - TransactionlFetcher
extension FetchTransactionService: TransactionsFetcher {
    func fetchTransactions() async -> [Transaction] {
        let requestData = TransactionsRequest.getTransactions

        do {
            let transactionsContainer: TransactionsContainer = try await
            requestManager.perform(requestData)

            return transactionsContainer.items
        } catch {
            return []
        }
    }
}
