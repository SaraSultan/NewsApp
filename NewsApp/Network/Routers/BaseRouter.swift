//
//  BaseRouter.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import Foundation
import Alamofire

public protocol BaseRouter : URLRequestConvertible {
    var path: String {get}
    var body: [String : Any]? {get}
    var parameters: [String : Any]? {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders {get}
}

extension BaseRouter {
    
    var path: String {
        return ""
    }
    
    var body: [String : Any]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers.dictionary
        
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
