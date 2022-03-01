//
//  NewsFeedCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var cellContainertView: UIView!
    @IBOutlet weak var newsFeedImageView: UIImageView!
    @IBOutlet weak var newsFeedDescriptionLabel: UILabel!
    @IBOutlet weak var newsFeedSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellContainertView.layer.borderColor = UIColor.darkGray.cgColor
        cellContainertView.layer.borderWidth = 1

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
