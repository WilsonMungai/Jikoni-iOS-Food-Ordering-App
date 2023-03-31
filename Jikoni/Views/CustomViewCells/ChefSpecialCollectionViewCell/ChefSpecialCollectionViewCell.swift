//
//  ChefSpecialCollectionViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit
import Kingfisher

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    
    // Cell identifier
    static let cellIdentifier = "ChefSpecialCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var foodImageLabel: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    @IBOutlet weak var foodCaloriesLabel: UILabel!
    
    // MARK: - Setup function
    // Function that takes specialDish as a param of type SpecialDish to assign the struct values to the cell
    func setup(specialDish: Dish) {
        foodImageLabel.kf.setImage(with: specialDish.image?.asUrl)
        foodNameLabel.text = specialDish.name
        foodDescriptionLabel.text = specialDish.description
        foodCaloriesLabel.text = specialDish.formattedCalories
    }
}
