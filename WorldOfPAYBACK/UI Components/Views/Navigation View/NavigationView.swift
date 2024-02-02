//
//  NavigationView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct NavigationView: View {
    // MARK: - Dependencies
    let title: String
    let onBackAction: (() -> Void)?
    let onRightAction: (() -> Void)?
    let rightIcon: String?

    // MARK: - Initalization
    init(title: String, onBackAction: (() -> Void)? = nil, onRightAction: (() -> Void)? = nil, rightIcon: String? = nil) {
        self.title = title
        self.onBackAction = onBackAction
        self.onRightAction = onRightAction
        self.rightIcon = rightIcon
    }

    // MARK: - View
    var body: some View {
        VStack(spacing: Theme.Dimensions.defaultLayoutMargin) {
            HStack(spacing: Theme.Dimensions.defaultLayoutMargin) {
                Button {
                    onBackAction?()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(Theme.Fonts.normal20)
                }
                Spacer()
                Text(title)
                    .foregroundColor(.black)
                    .font(Theme.Fonts.normal14)
                Spacer()
                if let icon = rightIcon {
                    Button {
                        onRightAction?()
                    } label: {
                        Image(icon)
                    }
                }
            }
            .padding(Theme.Dimensions.marginMediumVertical)
            Divider()
        }
    }
}

#Preview {
    NavigationView(title: "Some Title", onBackAction: nil, onRightAction: nil, rightIcon: nil)
}
