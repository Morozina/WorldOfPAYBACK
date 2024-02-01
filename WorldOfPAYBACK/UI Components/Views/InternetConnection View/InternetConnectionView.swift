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
        VStack {
            Image(systemName: "wifi.slash")
                .font(Theme.Fonts.normal56)
            Text("Not-Connected-Text")
                .padding(.all, Theme.Dimensions.defaultLayoutMargin)
            Button("Perform-Network-Request") {
                self.showAlertSheet = true
            }
        }
        .alert(isPresented: $showAlertSheet, content: {
            if monitor.isConnected {
                return Alert(title: Text("Is-Connected-Alert-Title"),
                             message: Text("Is-Connected-Alert-Message"),
                             dismissButton: .default(Text("Is-Connected-Alert-Button-Text")))
            }
            return Alert(title: Text("Not-Connected-Alert-Title"),
                         message: Text("Not-Connected-Alert-Message"),
                         dismissButton: .default(Text("Not-Connected-Alert-Button-Text")))
        })
    }
}

#Preview {
    InternetConnectionView()
}
