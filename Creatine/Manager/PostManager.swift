//
//  PostManager.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation
import AVFoundation

class PostManager {
    static let shared = PostManager()
    
    func getPosts(success: @escaping(_ posts: [Post]) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        ApiManager.shared.getPosts() { posts in
            success(posts)
        } failure: { error in
            failure(error)
        }
    }
}
