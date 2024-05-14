//
//  ViewStateProtocol.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation

protocol StateProtocol {
    var state: ViewState { get set }
}

enum ViewState {
    case loading
    case success
    case empty
    case error(NetworkError)
    
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
}
