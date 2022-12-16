//
//  RickMortyCell.swift
//  RickAndMorty
//
//  Created by Dilara Elçioğlu on 9.12.2022.
//

import UIKit

class RickMortyCell: UITableViewCell {
    @IBOutlet weak var rickMortyView: UIView!
    @IBOutlet weak var rmImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
