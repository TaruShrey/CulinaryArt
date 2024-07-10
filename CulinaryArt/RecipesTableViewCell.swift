//
//  RecipesTableViewCell.swift
//  CulinaryArt
//
//  Created by Mac on 09/07/24.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
