//
//  Theme+Constants.swift
//  Promova-TestTask
//
//  Created by Vladyslav Moroz on 12/01/2024.
//

import Foundation

extension Theme {
    enum Constants {
        /// Normal corner radius size
        static let normalCornerRadius: CGFloat = 8

        /// Small layout opacity 20%
        static let smallLayoutOpacity: Double = 0.2

        /// transaction Row Background Opacity 50%
        static let transactionRowBackgroundOpacity: Double = 0.5

        // 2 Line limit
        static let lineLimitTwo: Int = 2

        // 1 Line limit
        static let lineLimitOne: Int = 1

        enum FilterView {
            static let handleSize: CGSize = CGSize(width: 32, height: 4)
        }
    }
}
