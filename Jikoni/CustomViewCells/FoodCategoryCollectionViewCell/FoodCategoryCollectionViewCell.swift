//
//  FoodCategoryCollectionViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit
// Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web. It provides you a chance to use a pure-Swift way to work with remote images
import Kingfisher

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    
    // Cell identifier
    static let cellIdentifier = "FoodCategoryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageLabel: UIImageView!
    
    // MARK: - Setup function
    // Function that takes dish as a param of type DishCategory to assign the struct values to the cell
    func setup(dish: DishCategory) {
        foodNameLabel.text = dish.name
        foodImageLabel.kf.setImage(with: dish.image?.asUrl)
    }
}
