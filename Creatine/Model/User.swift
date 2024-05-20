//
//  User.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import Foundation

class User: Codable, Identifiable {
    
    var id: Int
    var name: String
    var email: String
    var phone: String
    var website: String

    init(){
        self.id = 0
        self.name = ""
        self.email = ""
        self.phone = ""
        self.website = ""
    }

    init(id: Int, name: String, email: String, phone: String, website: String) {
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


