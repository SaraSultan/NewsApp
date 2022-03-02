//
//  ActionKeyValueCellViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

struct ActionKeyValueCellViewModel: BaseCellViewModel {
    
    let key: String
    let value: String?
    let url: URL?
    
    init(url: URL?, key: String, value: String?) {
        self.url = url
        self.key = key
        self.value = value
    }
    
    func cellIdentifier() -> String {
        return "ActionKeyValueCell"
    }
}

