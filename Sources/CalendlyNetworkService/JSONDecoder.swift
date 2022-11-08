//
//  JSONDecoder.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

extension JSONDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }()
}
