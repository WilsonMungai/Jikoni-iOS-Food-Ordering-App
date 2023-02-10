//
//  DishCategory.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import UIKit

// Dish category data structure
struct FoodCategory: Decodable {
    let id: String?
    let name: String?
    let image: String?
    
    // The keys in our project may be defined differently from what we have in the backend
    // The backend looks like this "title" but in the project it is defined like this name
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
