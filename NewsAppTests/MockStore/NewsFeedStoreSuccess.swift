//
//  NewsFeedStoreSuccess.swift
//  NewsAppTests
//
//  Created by Sara Sultan on 03/03/2022.
//

import Foundation
@testable import NewsApp
 
class NewsFeedStoreSuccess : NewsFeedStoreProtocol {
    func loadNewsFeeds(_ page: Int, bySearchQuery query: String, withCompletionBlock completion: @escaping (NewsFeed) -> Void, failure: @escaping (NetworkError) -> Void) {
        MockupHandler().getMockupModel(jsonFileName: "NewsFeedSuccess") { (model: NewsFeed) in
            completion(model)
        }
    }
}
