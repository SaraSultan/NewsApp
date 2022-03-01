//
//  NewsFeedStore.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import Foundation

protocol NewsFeedStoreProtocol {
    func loadNewsFeeds(_ page: Int,
                       bySearchQuery query: String,
                       withCompletionBlock completion: @escaping (NewsFeed) -> Void,
                       failure: @escaping (NetworkError) -> Void)
}

class NewsFeedStore: NewsFeedStoreProtocol {
    
    func loadNewsFeeds(_ page: Int,
                       bySearchQuery query: String,
                       withCompletionBlock completion: @escaping (NewsFeed) -> Void,
                       failure: @escaping (NetworkError) -> Void) {
        
        let newsRouter = NewsRouter.getNewsFeed(query, page)
        
        NetworkManager.shared.getData(request: newsRouter) { jsonModel in
            let decoder = JSONDecoder()

            do {
                let newsFeedModel = try decoder.decode(NewsFeed.self, from: jsonModel)
                if let message = newsFeedModel.message {
                    failure(NetworkError(errorMsg: message))
                } else {
                    completion(newsFeedModel)
                }
            } catch {
                failure(NetworkError.genericError())
            }
            
        } failure: { errorModel in
            failure(errorModel)
        }
    }
    
}
