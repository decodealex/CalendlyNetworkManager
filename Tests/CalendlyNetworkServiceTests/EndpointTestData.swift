//
//  EndpointTestData.swift
//  
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation
@testable import CalendlyNetworkService

public enum ValidEndpoint: Endpoint {
    case getRequest
    case postRequestWithParameter(parameter: Int)
    
    public var scheme: HTTPScheme { .https }
    public var baseURL: String { "test.api.com" }
    public var headers: [String : String]? {
        [
            "Authorization": "Token token=123",
            "Account-Token": "123"
        ]
    }
    
    public var path: String {
        switch self {
        case .getRequest:
            return "/api/v1/getRequest"
        case .postRequestWithParameter:
            return "/api/v1/getRequestWithParameter"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getRequest:
            return .get
        case .postRequestWithParameter:
            return .post
        }
    }
    
    public var parameters: [String : String]? {
        switch self {
        case .postRequestWithParameter(parameter: let parameter):
            return ["parameter": "\(parameter)"]
        default: return nil
        }
    }
}

