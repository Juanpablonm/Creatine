//
//  InfoViewModel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 20/5/24.
//

import Foundation

class InfoViewModel: ObservableObject {
    var info: Info
    
    init() {
        self.info = Info(post: Post(), user: User(), comments: [])
    }
    
//    init(post: Post) {
//        self.info = Info(post: post, user: User(), comments: [])
//        loadInfo(post: post)
//    }
    
    func loadInfo(post: Post) -> Info {
        let user = UserViewModel(userId: post.userId).user
        let comments = CommentViewModel(postId: post.id).comments
        self.info = Info(post: post, user: user, comments: comments)
        return self.info
    }
}

