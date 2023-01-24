//
//  PopularDishesCollectionViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit
import Kingfisher

class PopularDishesCollectionViewCell: UICollectionViewCell {
    
    // Cell identifier
    static let cellIdentifier = "PopularDishesCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageLabel: UIImageView!
    @IBOutlet weak var caloriesAmountLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    // MARK: - Setup function
    // Function that takes popularDish as a param of type PopularDish to assign the struct values to the cell
    func setup(popularDish: PopularDish) {
        foodNameLabel.text = popularDish.name
        foodImageLabel.kf.setImage(with: popularDish.image?.asUrl)
        caloriesAmountLabel.text = popularDish.formattedCalories
        foodDescriptionLabel.text = popularDish.description
    }
}
