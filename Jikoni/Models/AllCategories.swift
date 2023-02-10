//
//  AllCategories.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation

struct AllCategories: Decodable {
    let categories: [FoodCategory]?
    let populars: [Food]?
    let specials: [Food]?
}
