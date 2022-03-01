//
//  NetworkConstants.swift
//  NewsApp
//
//  Created by Sara Sultan on 28/02/2022.
//

import Foundation

struct NetworkConstants {
    static let baseUrl = "https://newsapi.org/v2/"
    static let everythingPath = "everything"
    static let apiKey = "0e351c56e3a44fbb9065b1395043ad38"
}

enum SortByType: String {
    case relevancy = "relevancy"
    case popularity = "popularity"
    case publishedAt = "publishedAt"
}
