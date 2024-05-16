//
//  PostsViewModel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var state: ViewState = .empty
    
    init() {
        self.state = .empty
        loadPosts()
    }
    
    func loadPosts() {
        state = .loading
        PostManager.shared.getPosts { posts in
            DispatchQueue.main.async {
                self.posts = posts
                self.state = .success
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.state = .error(error)
            }
        }
    }
    
    func clearAllPosts() {
        posts.removeAll()
    }
    
    func deletePost(at index: Int) {
        posts.remove(at: index)
    }
}


