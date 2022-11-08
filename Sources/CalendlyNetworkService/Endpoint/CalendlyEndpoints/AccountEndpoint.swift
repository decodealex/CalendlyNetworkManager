//
//  UsersEndpoint.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

public enum UsersEndpoint: Endpoint {
    case getCurrentUser

    public var path: String {
        switch self {
        case .getCurrentUser: return "/users/me"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getCurrentUser:
            return .get
        }
    }
    
}
