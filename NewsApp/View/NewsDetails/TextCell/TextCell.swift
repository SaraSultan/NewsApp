//
//  TextCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

extension TextCell: CellConfigurable {
    func setUp(model: BaseCellViewModel) {
        guard let viewModel = model as? TextCellViewModel else { return }
        contentLabel.text = viewModel.text
        
        if viewModel.textType == .Primary {
            contentLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18) ?? .boldSystemFont(ofSize: 18)
        }else if viewModel.textType == .Secondary {
            contentLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 18) ?? .systemFont(ofSize: 18)
        }
    }
}

