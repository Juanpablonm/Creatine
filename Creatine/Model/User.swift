//
//  User.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation

class User: Codable, Identifiable {
    
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var website: String?
    
    init(id: Int? = nil, name: String? = nil, email: String? = nil, phone: String? = nil, website: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

struct UserResponse: Codable {
    var user: User
}


