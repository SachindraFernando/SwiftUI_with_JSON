//
//  PostDetailView.swift
//  SwiftUIWithJSON
//
//  Created by Sachindra Fernando on 2025-07-22.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.cyan)

                Text(post.body)
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        PostDetailView(post: Post(id: 1, userId: 1, title: "Sample Title", body: "Sample body of the post for preview."))
    }
}
