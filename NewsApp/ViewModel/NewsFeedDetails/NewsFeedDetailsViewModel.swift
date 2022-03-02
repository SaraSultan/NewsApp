//
//  NewsFeedDetailsViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

protocol NewsFeedDetailsViewModelProtocol {
    func prepareCellViewModels()
}

enum DetailsKeys: String {
    case author = "Author"
    case source = "Source"
    case content = "Content"
}

class NewsFeedDetailsViewModel: NewsFeedDetailsViewModelProtocol {
    
    private var article: Article
    var cellViewModels: [BaseCellViewModel]?
    
    init (article : Article) {
        self.article = article
    }
    
    func prepareCellViewModels() {
        
        cellViewModels = [BaseCellViewModel]()
        
        var dateString = ""
        if let date = article.publishedAt {
            dateString = date.formatDateLike(format: "EEEE, MMM d, yyyy")
        }
        let imageTextCellViewModel = ImageTextCellViewModel(imageURL: article.urlToImage, text: dateString)
        cellViewModels?.append(imageTextCellViewModel)
        
        if let title = article.title {
            let titleCellViewModel = TextCellViewModel(text: title, textType: .Primary)
            cellViewModels?.append(titleCellViewModel)
        }
        
        if let description = article.description {
            let descriptionCellViewModel = TextCellViewModel(text: description, textType: .Secondary)
            cellViewModels?.append(descriptionCellViewModel)
        }
        
        if let author = article.author {
            let authorCellViewModel = KeyValueCellViewModel(key: DetailsKeys.author.rawValue, value: author)
            cellViewModels?.append(authorCellViewModel)
        }
        
        if let source = article.source, let sourceName = source.name {
            let sourceURL = URL(string: article.url ?? "")
            let sourceCellViewModel = ActionKeyValueCellViewModel(url: sourceURL, key: DetailsKeys.source.rawValue, value: sourceName)
            cellViewModels?.append(sourceCellViewModel)
        }
        
        if let content = article.content {
            let contentCellViewModel = KeyValueCellViewModel(key: DetailsKeys.content.rawValue, value: content)
            cellViewModels?.append(contentCellViewModel)
        }
        
    }
}
