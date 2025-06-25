//
//  APIManager.swift
//  MedSync
//
//  Generated to abstract API calls for cleaner ViewModels.
//

import Foundation
import Combine

final class APIManager {
    static let shared = APIManager()
    private let baseURL = "http://34.174.19.154/api/"
    private init() {}
    
    private func makeURL(endpoint: String) -> String {
        // Remove leading slash from endpoint if present
        let cleanEndpoint = endpoint.hasPrefix("/") ? String(endpoint.dropFirst()) : endpoint
        return baseURL + cleanEndpoint
    }
    
    // Generic GET
    func get<T: Decodable>(endpoint: String, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.get(url: makeURL(endpoint: endpoint), headers: headers)
    }
    
    // Generic POST with body
    func post<T: Decodable, U: Encodable>(endpoint: String, body: U, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.post(url: makeURL(endpoint: endpoint), body: body, headers: headers)
    }
    
    // POST without body
    func post<T: Decodable>(endpoint: String, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.post(url: makeURL(endpoint: endpoint), headers: headers)
    }
    
    // Generic PUT with body
    func put<T: Decodable, U: Encodable>(endpoint: String, body: U, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.put(url: makeURL(endpoint: endpoint), body: body, headers: headers)
    }
    
    // PUT without body
    func put<T: Decodable>(endpoint: String, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.put(url: makeURL(endpoint: endpoint), headers: headers)
    }
    
    // DELETE
    func delete<T: Decodable>(endpoint: String, headers: [String: String]? = nil) -> AnyPublisher<T, NetworkError> {
        NetworkManager.shared.delete(url: makeURL(endpoint: endpoint), headers: headers)
    }
}

