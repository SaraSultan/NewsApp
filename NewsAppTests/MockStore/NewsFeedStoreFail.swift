//
//  NewsFeedStoreFail.swift
//  NewsApp
//
//  Created by Sara Sultan on 03/03/2022.
//

import Foundation
@testable import NewsApp

class NewsFeedStoreFail : NewsFeedStoreProtocol {
    func loadNewsFeeds(_ page: Int, bySearchQuery query: String, withCompletionBlock completion: @escaping (NewsFeed) -> Void, failure: @escaping (NetworkError) -> Void) {
        MockupHandler().getMockupModel(jsonFileName: "NewsFeedFail") { (model: NewsFeed) in
            if let message = model.message {
                failure(NetworkError(errorMsg: message))
            }
        }
    }
}
