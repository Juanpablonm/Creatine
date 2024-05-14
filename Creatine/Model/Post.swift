//
//  PostViewModel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation

class Post: Codable, Identifiable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init(userId: Int, id: Int? = nil, title: String? = nil, body: String? = nil) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }

    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}

struct PostResponse: Codable {
    var posts: [Post] = []
}


