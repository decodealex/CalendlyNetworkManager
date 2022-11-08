//
//  NetworkManager.swift
//  takehome
//

import Foundation

public protocol NetworkManagerProtocol {
    func setAccessToken(_ accessToken: String)
    func request(urlSession: URLSession, endpoint: Endpoint) async throws -> Data
}

public class NetworkManager {
    
    private var accessToken: String?
    static public let shared = NetworkManager()
    
    private func handleResponse(_ data: Data, response: URLResponse) throws {
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            let error = try? JSONDecoder.defaultDecoder.decode(ErrorResponseModel.self, from: data)
            throw NetworkError.generic(description: error?.description ?? "Unexpected error happened")
        }
    }
}

extension NetworkManager: NetworkManagerProtocol {

    public func setAccessToken(_ newAccessToken: String) {
        accessToken = newAccessToken
    }

    public func request(urlSession: URLSession, endpoint: Endpoint) async throws -> Data {
        guard let accessToken = accessToken else { throw NetworkError.generic(description: "Missing Access Token") }
        var request = try endpoint.buildURLRequest()
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await urlSession.data(for: request)
        try handleResponse(data, response: response)

        return data
    }
}

