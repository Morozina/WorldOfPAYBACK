//
//  DashboardView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - View Model
    @StateObject var viewModel: DashboardViewModel

    // MARK: - Network Monitor
    @ObservedObject var monitor = NetworkMonitor()

    // MARK: - Router
    @EnvironmentObject var router: Router

    var body: some View {
        if monitor.isConnected {
            MainContentSection
        } else {
            InternetConnectionView()
        }
    }

    var MainContentSection: some View {
        List {
            HeaderSection
            CardsSection
        }
        .task {
            await viewModel.onAppear()
        }
        .refreshable {
            await viewModel.fetchTransactions()
        }
        .listStyle(PlainListStyle()) 
        .listRowSeparator(.hidden)
        .navigationTitle("Transaction-List-Title".localized)
        .toolbar {
            ToolbarItem {
                ToolBarButton
            }
        }
        .overlay {
            if viewModel.isLoading && viewModel.fetchedTransactions.isEmpty {
                ProgressView("Fetching-Transactions-Text".localized)
            }
        }
    }

    var HeaderSection: some View {
        HStack{
            Text("Transactions-Sum".localized)
                .font(Theme.Fonts.boldl18)
                .lineLimit(Theme.Constants.lineLimitOne)
            Text("\(viewModel.sumOfTransactions)")
                .modifier(TransactionSum(color: .orange))
        }
    }

    var CardsSection: some View {
        ForEach(viewModel.filteredTransactions, id: \.id) { item in
            Button {
                router.push(to: .transaction(transactionItem: item.transaction))
            } label: {
                TransactionsRawView(transaction: item.transaction)
            }
        }
    }

    var ToolBarButton: some View {
            Button {
                viewModel.filterPickerIsPresented.toggle()
            } label: {
                Label("Filter", systemImage: "slider.horizontal.3")
            }
            .sheet(isPresented: $viewModel.filterPickerIsPresented) {
                FilterView(filterPickerIsPresented: $viewModel.filterPickerIsPresented, selectedCategory: viewModel.categorySelection, categories: viewModel.transactionsCategories, performSelection: viewModel.filterTransactionsWith)
            }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
