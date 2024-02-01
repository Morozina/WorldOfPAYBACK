//
//  Router.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

import SwiftUI

final class Router: ObservableObject {
    // MARK: - Root
    @Published var root: AppRoute

    // MARK: - Paths
    @Published var homePath: [AppRoute] = []

    init(root: AppRoute) {
        self.root = root
    }

    // MARK: - Navigation Methods
    /// Method push new screen for view
    /// - Parameters:
    ///   - path:       app route destination to screen
    func push(to path: AppRoute) {
        homePath.append(path)
    }

    /// Method to remove last screen from view
    func pop() {
        homePath.removeLast()
    }
}
