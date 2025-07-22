//
//  PostsListView.swift
//  SwiftUIWithJSON
//
//  Created by Sachindra Fernando on 2025-07-22.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var vm = PostsViewModel()

    var body: some View {
        NavigationView {
            Group {
                if vm.isLoading {
                    ProgressView("Loading…")
                } else if let error = vm.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(vm.posts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(post.title)
                                    .font(.headline)
                                    .foregroundColor(.cyan)
                                Text(post.body)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
        }
        .task {
            await vm.loadPosts()
        }
    }
}

#Preview {
    PostsListView()
}
