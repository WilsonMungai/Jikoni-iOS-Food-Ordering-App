//
//  PopularDishesCollectionViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit

class PopularDishesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageLabel: UIImageView!
    @IBOutlet weak var caloriesAmountLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
