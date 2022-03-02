//
//  NewsFeedCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import UIKit
import Kingfisher

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var cellContainertView: UIView!
    @IBOutlet weak var newsFeedImageView: UIImageView!
    @IBOutlet weak var newsFeedDescriptionLabel: UILabel!
    @IBOutlet weak var newsFeedSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        cellContainertView.layer.borderColor = UIColor.darkGray.cgColor
        cellContainertView.layer.borderWidth = 1
        
        cellContainertView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewsFeedCell: CellConfigurable {
    func setUp(model: BaseCellViewModel) {
        guard let viewModel = model as? NewsFeedCellViewModel else { return }
        
        if let imageURL = viewModel.imageURL {
            newsFeedImageView.kf.setImage(
                with: URL(string: imageURL),
                placeholder: UIImage(named: "placeholder"),
                options:nil)
        }else{
            newsFeedImageView.image = UIImage(named: "placeholder")
        }
        
        newsFeedDescriptionLabel.text = viewModel.description ?? "N/A"
        newsFeedSourceLabel.text = viewModel.source ?? "N/A"
    }
}
