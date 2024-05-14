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
