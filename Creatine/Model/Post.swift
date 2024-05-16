//
//  PostViewModel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation

class Post: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
    var isFavorite: Bool? = false

    init(userId: Int, id: Int, title: String, body: String, isFavorite: Bool = false) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}



class PostResponse: ObservableObject, Decodable {
    @Published var posts: [Post]

    enum CodingKeys: String, CodingKey {
        case posts
    }
    
    init(posts: [Post] = []) {
        self.posts = posts
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posts = try container.decode([Post].self, forKey: .posts)
    }
}



