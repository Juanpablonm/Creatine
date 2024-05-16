//
//  CommentViewModel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var state: ViewState
    
    init(postId: Int) {
        self.state = .empty
        loadComments(postId: postId)
    }
    
    func loadComments(postId: Int) {
        state = .loading
        CommentManager.shared.getCommentsByPostId(postId: postId) { comments in
            DispatchQueue.main.async {
                self.comments = comments
                self.state = .success
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.state = .error(error)
            }
        }
    }
}


