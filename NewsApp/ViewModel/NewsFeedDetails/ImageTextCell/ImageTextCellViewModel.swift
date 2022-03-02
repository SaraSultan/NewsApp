//
//  ImageTextCellViewModel.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation

struct ImageTextCellViewModel: BaseCellViewModel {
    let imageURL: String?
    let text: String
    
    init(imageURL: String?, text: String = "") {
        self.imageURL = imageURL
        self.text = text
    }
    
    func cellIdentifier() -> String {
        return "ImageTextCell"
    }
}
