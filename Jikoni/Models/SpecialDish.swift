//
//  SpecialDish.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import UIKit

// Special dishes data structure
struct SpecialDish {
    let id: String?
    let name: String?
    let description: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Calories"
    }
}
