//
//  NewsRouter.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import Foundation
import Alamofire

enum NewsRouter: BaseRouter {
    case getNewsFeed(String, Int)
}

extension NewsRouter {
    
    var path: String {
        return NetworkConstants.everythingPath
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getNewsFeed(let query, let page):
            return ["q" : query,
                    "page" : page,
                    "sortBy" : SortByType.publishedAt.rawValue,
                    "apiKey" : NetworkConstants.apiKey]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNewsFeed:
            return .get
        }
    }
}
