//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

class NewsFeedsViewModel {
    var cellViewModels = [BaseCellViewModel]()
    private var newsFeedStore: NewsFeedStoreProtocol
    var currentPage = 1
    var query = "apple"
    
    init(newsFeedStore: NewsFeedStoreProtocol = NewsFeedStore()) {
        self.newsFeedStore = newsFeedStore
    }
    
    func loadNewsFeedsPage(withSuccess success: @escaping () -> Void,
                           withFailure fail: @escaping (String) -> Void) {
        
        newsFeedStore.loadNewsFeeds(currentPage, bySearchQuery: query) { [weak self] newsFeed in
            if let articles = newsFeed.articles {
                self?.prepCellsViewModelsWithArticles(articles)
            }
            success()
        } failure: { networkError in
            fail(networkError.errorMsg)
        }
    }
    
    private func prepCellsViewModelsWithArticles(_ articles: [Article]) {
        if currentPage == 1 {
            cellViewModels.removeAll()
        }
    
        let articlesViewModels = articles.map {
            NewsFeedCellViewModel(article: $0)
        }
        
        cellViewModels.append(contentsOf: articlesViewModels)
    }
}
