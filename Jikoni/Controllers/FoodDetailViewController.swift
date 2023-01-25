//
//  FoodDetailViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import UIKit
import Kingfisher

/// Class that displays the selected food details
class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCalories: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    // Holds the selected food values
    var selectedFood: Food!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateFields()
    }
    
    // Function that populates the cells with data from the home view controller
    private func populateFields() {
        foodName.text = selectedFood.name
        foodImageView.kf.setImage(with: selectedFood.image?.asUrl)
        foodCalories.text = selectedFood.formattedCalories
        foodDescription.text = selectedFood.description
    }
    
    
    // Order button
    @IBAction func orderButtonTapped(_ sender: UIButton) {
    }
    
}
