//
//  FilterView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationView(title: "Filter", onBackAction: router.pop)

        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Spacer()
    }
}

#Preview {
    FilterView()
}
