//
//  UserManager.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation
import AVFoundation

class UserManager {
    static let shared = UserManager()
    
    func getUserBy(userId: Int, success: @escaping(_ user: User) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        ApiManager.shared.getUser(userId: userId) { user in
            success(user)
        } failure: { error in
            failure(error)
        }
    }
}
