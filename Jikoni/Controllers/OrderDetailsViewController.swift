//
//  OrderDetailsViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-03-02.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var orderImage: UIImageView!
    
    // Holds the selected food values
    var selectedFood: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateFields()
    }
    
    // Function that populates the cells with data from the view controller pushing data here
    private func populateFields() {
        orderImage.kf.setImage(with: selectedFood.image?.asUrl)
    }

}
