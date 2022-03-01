//
//  NetworkError.swift
//  NewsApp
//
//  Created by Sara Sultan on 28/02/2022.
//

import Foundation

struct NetworkError: Error {
    
    let errorMsg: String
    static let genericError = {
        NetworkError(errorMsg: "Something went wrong")
    }
    static let tryAgainError = {
        NetworkError(errorMsg: "Try Again Error")
    }
}
