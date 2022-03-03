//
//  TextCellViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

enum TextType {
    case Primary
    case Secondary
}

struct TextCellViewModel: BaseCellViewModel {
    
    let text: String
    let textType: TextType
    
    init(text: String, textType: TextType) {
        self.text = text
        self.textType = textType
    }
    
    func cellIdentifier() -> String {
        return "TextCell"
    }
}
