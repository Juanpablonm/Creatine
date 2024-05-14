//
//  LGXResponse.swift
//  app
//
//  Created by Jose Merida on 23/5/23.
//

import Foundation

struct CreatineResponse<T: Decodable>: Decodable {
    var data: T?
    var error: String?

    
    init(data: T?) {
        self.data = data
    }
}
