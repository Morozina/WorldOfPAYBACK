//
//  FilterView.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import SwiftUI

struct FilterView: View {
    // MARK: - Binding
    @Binding var filterPickerIsPresented: Bool

    // MARK: - States
    @State var selectedCategory: Int

    // MARK: - Dependencies
    let categories: [Int]
    let performSelection: (Int) -> Void

    var body: some View {
        VStack(spacing: .zero) {
            RectangleHandleSection
            FormSection
        }
    }

    var RectangleHandleSection: some View {
        RoundedRectangle(cornerRadius: Theme.Constants.normalCornerRadius)
            .fill(Color(Theme.Colors.gray))
            .frame(width: Theme.Constants.FilterView.handleSize.width, height: Theme.Constants.FilterView.handleSize.height)
            .padding(.top, Theme.Dimensions.marginSmallHorizontal)
            .frame(maxWidth: .infinity)
            .background(Color(Theme.Colors.lightGray))
    }

    var FormSection: some View {
        Form {
            Section {
                Picker("Category-Section-Title".localized, selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {
                        Text(String($0))
                    }
                }
                .onChange(of: selectedCategory) {
                    performSelection(selectedCategory)
                    filterPickerIsPresented.toggle()
                }
            } footer: {
                Text("Category-Section-Footer".localized)
            }
            Button("Search-Filter-View-Clear-Button".localized, role: .destructive) {
                selectedCategory = 0
            }
        }
    }
}

#Preview {
    FilterView(filterPickerIsPresented: .constant(false), selectedCategory: 0, categories: [], performSelection: {_ in })
}
