//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Sara Sultan on 28/02/2022.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    private init() {}
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    } ()
    
    func getData (request: URLRequestConvertible,
                  completion: @escaping (Data) -> Void,
                  failure: @escaping (NetworkError) -> Void) {
        AF.request(request).responseData(completionHandler: { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure:
                failure(NetworkError.genericError())
            }
        })
    }
}
