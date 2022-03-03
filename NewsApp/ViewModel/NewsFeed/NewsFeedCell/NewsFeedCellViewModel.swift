//
//  NewsFeedCellViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

struct NewsFeedCellViewModel: BaseCellViewModel {
   
    var imageURL : String?
    var description : String?
    var source : String?
    var article: Article?
    
    init(article: Article) {
        self.article = article
        self.imageURL = article.urlToImage
        self.description = article.description
        self.source = article.source?.name
    }
    
    func cellIdentifier() -> String {
        return "NewsFeedCell"
    }
}
