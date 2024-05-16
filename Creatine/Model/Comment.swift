//
//  Comment.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation

class Comment: Codable, Identifiable {
    
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    
    init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }

    static func == (lhs: Comment, rhs: Comment) -> Bool {
        return lhs.id == rhs.id
    }
}


struct CommentResponse: Codable {
    var user: [Comment] = []
}


