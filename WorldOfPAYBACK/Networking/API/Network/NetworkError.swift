//
//  NetworkError.swift
//  WorldOfPAYBACK
//
//  Created by Vladyslav Moroz on 01/02/2024.
//

import Foundation

enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL

  var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "Incorrect URL string."
    }
  }
}
