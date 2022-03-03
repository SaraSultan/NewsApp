//
//  StringExtension.swift
//  NewsApp
//
//  Created by Sara Sultan on 03/03/2022.
//

import Foundation

extension String {
    func formatDateLike(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let locale = "US_POSIX"
        dateFormatter.locale = Locale(identifier: locale)
        let dateFromString: Date = dateFormatter.date(from: self) ?? Date()
        return dateFormatter.string(from: dateFromString)
    }
}
