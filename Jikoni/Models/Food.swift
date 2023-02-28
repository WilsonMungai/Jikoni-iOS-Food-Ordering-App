//
//  PopularDish.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import UIKit

// Popular dishes data structure
struct Dish: Decodable {
    let id: String?
    let name: String?
    let image: String?
    let description: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Calories"
    }
}
