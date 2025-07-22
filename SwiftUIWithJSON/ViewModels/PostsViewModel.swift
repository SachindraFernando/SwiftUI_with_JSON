//
//  PostsViewModel.swift
//  SwiftUIWithJSON
//
//  Created by Sachindra Fernando on 2025-07-22.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: NetworkServiceProtocol

    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }

    func loadPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            posts = try await service.fetchPosts()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
