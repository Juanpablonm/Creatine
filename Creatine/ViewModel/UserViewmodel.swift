//
//  UserViewmodel.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User = User()
    @Published var state: ViewState
    
    init(userId: Int) {
        self.state = .empty
        loadUser(userId: userId)
    }
    
    func loadUser(userId: Int) {
        state = .loading
        UserManager.shared.getUserBy(userId: userId) { user in
            DispatchQueue.main.async {
                self.user = user
                self.state = .success
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.state = .error(error)
            }
        }
    }
}
