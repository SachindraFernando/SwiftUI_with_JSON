//
//  NetworkService.swift
//  SwiftUIWithJSON
//
//  Created by Sachindra Fernando on 2025-07-22.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchPosts() async throws -> [Post]
}

class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "\(baseURL)/posts")!
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Post].self, from: data)
    }
}
