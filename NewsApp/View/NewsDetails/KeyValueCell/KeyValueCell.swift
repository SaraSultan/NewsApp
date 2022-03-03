//
//  KeyValueCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import UIKit

class KeyValueCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

extension KeyValueCell: CellConfigurable {
    func setUp(model: BaseCellViewModel) {
        guard let viewModel = model as? KeyValueCellViewModel else { return }
        keyLabel.text = viewModel.key
        valueLabel.text = viewModel.value ?? "N/A"
    }
}

