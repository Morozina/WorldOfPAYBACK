//
//  RouterView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct RouterView<content: View>: View {
    // MARK: - Router
    @StateObject var router: Router

    // MARK: - View Builder
    @ViewBuilder var buildView: (AppRoute) -> content

    var body: some View {
        NavigationStack(path: $router.homePath) {
            buildView(router.root)
                .navigationDestination(for: AppRoute.self) { path in
                    buildView(path)
                        .toolbar(.hidden)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    RouterView(router: Router(root: .dashboard)) { path in
        switch path {
        case .dashboard:
            DashboardView()
        default:
            DashboardView()
        }
    }
}
