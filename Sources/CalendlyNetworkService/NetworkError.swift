//
//  NetworkError.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

public enum NetworkError: Error {
    case badURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case generic(description: String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Invalid URL", comment: "")
        case .unableToComplete:
            return NSLocalizedString("Unable to complete. Check your internet connection", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "")
        case .invalidData:
            return NSLocalizedString("Invalid data", comment: "")
        case .generic(description: let description):
            return NSLocalizedString(description, comment: description)
        }
    }
}
