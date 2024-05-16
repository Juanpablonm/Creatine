//
//  CommentManager.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation
import AVFoundation

class CommentManager {
    static let shared = CommentManager()
    
    func getCommentsByPostId(postId: Int, success: @escaping(_ comments: [Comment]) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        ApiManager.shared.getCommentsByPostId(postId: postId) { comments in
            success(comments)
        } failure: { error in
            failure(error)
        }
    }
}

