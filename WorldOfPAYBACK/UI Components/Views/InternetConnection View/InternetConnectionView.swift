//
//  InternetConnectionView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct InternetConnectionView: View {
    @ObservedObject var monitor = NetworkMonitor()
    @State private var showAlertSheet = false

    var body: some View {
        VStack(spacing: Theme.Dimensions.defaultLayoutMargin) {
            Image(systemName: "wifi.slash")
                .font(Theme.Fonts.normal56)
            Text("Not-Connected-Text".localized)
                .padding(.all, Theme.Dimensions.defaultLayoutMargin)
            Button("Perform-Network-Request".localized) {
                self.showAlertSheet = true
            }
        }
        .alert(isPresented: $showAlertSheet, content: {
            if monitor.isConnected {
                return Alert(title: Text("Is-Connected-Alert-Title".localized),
                             message: Text("Is-Connected-Alert-Message".localized),
                             dismissButton: .default(Text("Is-Connected-Alert-Button-Text".localized)))
            }
            return Alert(title: Text("Not-Connected-Alert-Title".localized),
                         message: Text("Not-Connected-Alert-Message".localized),
                         dismissButton: .default(Text("Not-Connected-Alert-Button-Text".localized)))
        })
    }
}

#Preview {
    InternetConnectionView()
}
