//
//  RowCard.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct RowCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: Theme.Dimensions.marginSuperLarge)
            .listRowSeparator(.hidden)
            .padding(.all, Theme.Dimensions.marginExtraExtraSmall)
    }
}
