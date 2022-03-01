//
//  Article.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String? // ex: "2021-09-08T19:15:05Z"
    let content: String?
}
