//
//  DashboardViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    // MARK: - Published
    @Published var isLoading: Bool
    @Published var filterPickerIsPresented = false
    @Published var filteredTransactions: [IdentifiableTransaction] = []
    @Published var sumOfTransactions: Int = .zero
    @Published var transactionsCategories: [Int] = []

    // MARK: - Dependencies
    var categorySelection = Category.all.rawValue
    var fetchedTransactions: [IdentifiableTransaction] = []
    private let transactionsFetcher: TransactionsFetcher

    // MARK: - Initialization
    init(isLoading: Bool = true, transactionsFetcher: TransactionsFetcher = TransactionsFetcherMock()) {
        self.isLoading = isLoading
        self.transactionsFetcher = transactionsFetcher
    }

    // MARK: - Not private Methods
    func onAppear() async {
        if fetchedTransactions.isEmpty {
            await fetchTransactions()
        } else if categorySelection != Category.all.rawValue {
            filterTransactionsWith(category: categorySelection)
        } else {
            filterTransactionsWith()
        }
    }

    func fetchTransactions() async {
        clear()

        fetchedTransactions = await transactionsFetcher.fetchTransactions().enumerated().map { (index, transaction) in
            return IdentifiableTransaction(id: index, transaction: transaction)
        }
        .sorted {
            guard let firstDate = DateHelper.stringToDate(date: $0.transaction.transactionDetail.bookingDate), let secondDate = DateHelper.stringToDate(date: $1.transaction.transactionDetail.bookingDate) else { return false }

            return firstDate > secondDate
        }

        filteredTransactions = fetchedTransactions

        sumValuesOfTransactionsWith(category: Category.all.rawValue)
        fetchCategories()
    }

    func filterTransactionsWith(category: Int = Category.all.rawValue) {
        filteredTransactions.removeAll()
        isLoading = true

        if category == Category.all.rawValue {
            filteredTransactions = fetchedTransactions
        } else {
            filteredTransactions = fetchedTransactions.filter { $0.transaction.category == category }
        }

        sumValuesOfTransactionsWith(category: category)
        isLoading = false
        categorySelection = category
    }

    // MARK: - Private Methods
    private func sumValuesOfTransactionsWith(category: Category.RawValue) {
        sumOfTransactions = filteredTransactions.map({
            $0.transaction.transactionDetail.value.amount}).reduce(0, +)
    }

    private func fetchCategories() {
        var categories = fetchedTransactions.map {
            $0.transaction.category
        }
        categories.append(Category.all.rawValue)
        transactionsCategories = categories.removingDuplicates().sorted()
        isLoading = false
    }

    private func clear() {
        isLoading = true
        fetchedTransactions.removeAll()
        categorySelection = Category.all.rawValue
    }
}
