//
//  ImageTextCell.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import UIKit

class ImageTextCell: UITableViewCell {
    
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var viewContaningLabel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ImageTextCell: CellConfigurable {
    func setUp(model: BaseCellViewModel) {
        guard let viewModel = model as? ImageTextCellViewModel else { return }
        
        if let imageURL = viewModel.imageURL {
            contentImage.kf.setImage(
                with: URL(string: imageURL),
                placeholder: UIImage(named: "placeholder"),
                options:nil)
        }else{
            contentImage.image = UIImage(named: "placeholder")
        }
       
        
        contentLabel.text = viewModel.text
        viewContaningLabel.isHidden = viewModel.text == ""
    }
}
