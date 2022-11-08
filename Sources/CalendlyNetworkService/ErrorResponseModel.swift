//
//  ErrorResponseModel.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 05.11.2022.
//

import Foundation

public struct ErrorResponseModel: Decodable {
    private let title: String
    private let message: String
    
    public var description: String {
         "\n Error title: \(title);\n Message: \(message)"
    }
}
