//
//  Order.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-27.
//

import Foundation

struct Orders: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
