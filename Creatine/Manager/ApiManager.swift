//
//  ApiManager.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation
//import Alamofire

class ApiManager {
    static let shared = ApiManager()
    var isConnected: Bool {
        NetworkMonitor.shared.isNetworkReachable
    }
    func getPosts(success: @escaping(_ posts: [Post]) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        guard let url: URL = Endpoint.getPosts.url else {
            failure(.unknownError)
            return
        }
        
        guard isConnected else {
            failure(.internetError)
            return
        }
        
//        AF.ligaXRequest(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: CreatineResponse<PostResponse>.self) { response in
//            if response.error != nil {
//                failure(.errorWithCode(response.response?.statusCode))
//            } else {
//                guard let countries = try? response.result.get().data?.countries else {
//                    failure(.unknownError)
//                    return
//                }
//                
//                guard !countries.isEmpty else {
//                    failure(.unknownError)
//                    return
//                }
//                
//                success(countries)
//            }
//        }
    }
}
enum Endpoint {
    case getPosts
    case getUsers
    case getComments
    var url: URL? {
        switch self {
        case .getPosts:
            return URL.serverURL(path: "posts")
        case .getUsers:
            return URL.serverURL(path: "users")
        case .getComments:
            return URL.serverURL(path: "comments")
        }
    }
}

extension URL {
    static func serverURL(path: String) -> URL? {
        guard let baseURL = Bundle.main.infoDictionary?["Base Url"] as? String else {
            return nil
        }
        return URL(string: "\(baseURL)/\(path)")
    }
}
