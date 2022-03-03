//
//  ActionKeyValueCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import UIKit

class ActionKeyValueCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var actionImg: UIImageView!
    
    var viewModel: ActionKeyValueCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

extension ActionKeyValueCell: CellConfigurable {
    func setUp(model: BaseCellViewModel) {
        guard let viewModel = model as? ActionKeyValueCellViewModel else { return }
        self.viewModel = viewModel
        
        keyLabel.text = viewModel.key
        valueLabel.text = viewModel.value
        actionImg.isHidden = (viewModel.url == nil)
    }
}
