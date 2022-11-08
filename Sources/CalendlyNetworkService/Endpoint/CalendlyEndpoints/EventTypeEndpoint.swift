//
//  EventTypeEndpoint.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import Foundation

public enum EventTypeEndpoint: Endpoint {
    case getUserEvents(_ userURI: String)
    case getUserEventsPaginated(_ userURI: String, pageToken: String)
    
    public var path: String {
        switch self {
        case .getUserEvents, .getUserEventsPaginated: return "/event_types"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getUserEvents, .getUserEventsPaginated:
            return .get
        }
    }
    
    public var parameters: [String : String]? {
        switch self {
        case .getUserEvents(let userURI):
            return ["user": userURI]
        case .getUserEventsPaginated(let userURI, pageToken: let pageToken):
            return ["user": userURI,
                    "page_token": pageToken]
        }
    }
    
}
