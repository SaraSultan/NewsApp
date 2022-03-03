//
//  CellConfigurable.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import Foundation
import UIKit

protocol CellConfigurable: UITableViewCell {
    func setUp(model: BaseCellViewModel)
}
