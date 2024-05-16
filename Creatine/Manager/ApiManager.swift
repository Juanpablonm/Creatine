//
//  ApiManager.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 14/5/24.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    var isConnected: Bool {
        NetworkMonitor.shared.isNetworkReachable
    }
    
    func getPosts(success: @escaping(_ posts: [Post]) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        guard let url = Endpoint.getPosts.url else {
               failure(.unknownError)
               return
           }
           
           guard isConnected else {
               failure(.internetError)
               return
           }
           
           AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: [Post].self) { response in
               switch response.result {
               case .success(let posts):
                   success(posts)
               case .failure:
                   failure(.unknownError)
               }
           }
       }
    
    func getUser(userId: Int?, success: @escaping(_ user: User) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        
        guard let id = userId, let url: URL = Endpoint.getUser(userId: id).url else {
            failure(.unknownError)
            return
        }
        
        guard isConnected else {
            failure(.internetError)
            return
        }
        
        AF.creatineRequest(url, method: .get).validate(statusCode: 200..<500).responseDecodable(of: User.self) { response in
            if response.error != nil {
                failure(.errorWithCode(response.response?.statusCode))
            } else {
                guard let user = try? response.result.get() else {
                    failure(.unknownError)
                    return
                }
                success(user)
            }
        }
    }
    
    func getCommentsByPostId(postId: Int?, success: @escaping(_ comments: [Comment]) -> Void, failure: @escaping(_ error: NetworkError) -> Void) {
        
        guard let id = postId, let url: URL = Endpoint.getCommentsByPostId(postId: id).url else {
            failure(.unknownError)
            return
        }
        
        guard isConnected else {
            failure(.internetError)
            return
        }
        
        AF.creatineRequest(url, method: .get).validate(statusCode: 200..<500).responseDecodable(of: [Comment].self) { response in
            switch response.result {
            case .success(let comments):
                success(comments)
            case .failure:
                failure(.unknownError)
            }
        }
        }
    }
enum Endpoint {
    case getPosts
    case getUser(userId: Int)
    case getCommentsByPostId(postId: Int)
    var url: URL? {
        switch self {
        case .getPosts:
            return URL.serverURL(path: "posts")
        case .getUser(let userId):
            return URL.serverURL(path: "users/\(userId)")
        case .getCommentsByPostId(let postId):
            return URL.serverURL(path: "comments?postId=\(postId)")
        }
    }
}

extension URL {
    static func serverURL(path: String) -> URL? {
        return URL(string: "https://jsonplaceholder.typicode.com/\(path)")
    }
}

extension Session {
    func creatineRequest(_ convertible: URLConvertible,
                         method: HTTPMethod = .get,
                         parameters: Parameters? = nil,
                         encoding: ParameterEncoding = JSONEncoding.default,
                         headers: HTTPHeaders? = [.authorization(bearerToken: "")],
                         interceptor: RequestInterceptor? = nil,
                         requestModifier: RequestModifier? = nil) -> DataRequest {
        return request(convertible, method: method, parameters: parameters, encoding: encoding, interceptor: interceptor, requestModifier: requestModifier)
    }
}
