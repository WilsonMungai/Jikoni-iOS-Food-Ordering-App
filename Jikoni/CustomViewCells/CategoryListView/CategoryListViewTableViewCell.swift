//
//  CategoryListViewTableViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-26.
//

import UIKit
import Kingfisher

class CategoryListViewTableViewCell: UITableViewCell {
    
    // Cell identifier
    static let cellIdentifier = "CategoryListViewTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    
    // MARK: - Setup function
    // Function that takes specialDish as a param of type SpecialDish to assign the struct values to the cell
    func setup(category: Food) {
        dishImageView.kf.setImage(with: category.image?.asUrl)
        dishName.text = category.name
        dishDescription.text = category.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.food?.image?.asUrl)
        dishName.text = order.food?.name
        dishDescription.text = order.name
    }
}
