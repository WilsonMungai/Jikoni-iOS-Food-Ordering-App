//
//  FoodDetailViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import UIKit
import Kingfisher
import ProgressHUD

/// Class that displays the selected food details
class FoodDetailViewController: UIViewController {
    
    // MARK: - Collection view outlets
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCalories: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    // Holds the selected food values
    var selectedFood: Dish!
    
    // Function that populates the cells with data from the view controller pushing data here
    private func populateFields() {
        foodImageView.kf.setImage(with: selectedFood.image?.asUrl)
        foodName.text = selectedFood.name
        foodCalories.text = selectedFood.formattedCalories
        foodDescription.text = selectedFood.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        populateFields()
    }
    
    
    // Order button
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Whooops!! \n Please Enter Your Name!")
            return
        }
        // post orders
        ProgressHUD.show("Placing Your Order...")
        NetworkService.shared.placeOrder(dishId: selectedFood.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Hurray!👩‍🍳 \n Your order has been received")
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
            }
            
        }
    }
    
}
