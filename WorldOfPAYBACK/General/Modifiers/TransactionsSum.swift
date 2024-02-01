//
//  TransactionsSum.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct TransactionSum: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.all, Theme.Dimensions.marginExtraExtraSmall)
            .background(color.opacity(Theme.Constants.smallLayoutOpacity))
            .cornerRadius(Theme.Constants.normalCornerRadius)
            .foregroundColor(color)
            .font(Theme.Fonts.normal14)
            .lineLimit(Theme.Constants.lineLimitOne)
    }
}
