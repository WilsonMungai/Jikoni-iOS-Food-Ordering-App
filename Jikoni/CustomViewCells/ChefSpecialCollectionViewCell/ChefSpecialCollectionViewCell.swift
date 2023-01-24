//
//  ChefSpecialCollectionViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageLabel: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    @IBOutlet weak var foodCaloriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
