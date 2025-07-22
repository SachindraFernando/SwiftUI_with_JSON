//
//  Post.swift
//  SwiftUIWithJSON
//
//  Created by Sachindra Fernando on 2025-07-22.
//

import Foundation

struct Post: Identifiable, Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
