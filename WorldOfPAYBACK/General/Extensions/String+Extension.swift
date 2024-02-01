//
//  String+Extension.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
