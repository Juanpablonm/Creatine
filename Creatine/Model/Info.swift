//
//  Info.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 20/5/24.
//

import Foundation

class Info: Codable, Identifiable {
    var post: Post
    var user: User
    var comments: [Comment]
   
    init(post: Post, user: User, comments: [Comment]) {
            self.post = post
            self.user = user
            self.comments = comments
        }

    static func == (lhs: Info, rhs: Info) -> Bool {
        return lhs.id == rhs.id
    }
}

