//
//  KeyValueCellViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

struct KeyValueCellViewModel: BaseCellViewModel {
    let key: String
    let value: String?
    
    init(key: String, value: String?) {
        self.key = key
        self.value = value
    }
    
    func cellIdentifier() -> String {
        return "KeyValueCell"
    }

}
