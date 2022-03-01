//
//  NewsFeed.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import Foundation

struct NewsFeed: Codable {
    var status: String?
    var code: String?
    var message: String?
    var totalResults: Int?
    var articles: [Article]?
}
