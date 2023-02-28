//
//  Route.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation

enum Route {
    // this is the server address for our backend, where the backend is being hosted
    static let baseUrl = "https://yummie.glitch.me"
    
    // Fetchoing data to display on the ui
    case fecthAllCategiogies
    
    // place order end point
    // passing an enum with the type of data you want to be returned
    case placeOrder(String)
    
    // fetchCategoryDished
    case fetchCategoryDishes(String)
    
    // Fetch  orders
    case fetchOrders
    
//    case temp
    
    // This computed property will return the path to the endpoint
    var description: String {
        // switching on self forces us to implement all cases that are in the enum
        switch self {
            // This defines the path/ endpoint to  the resource
        case .fecthAllCategiogies: return "/dish-categories"
            // This places the orders
            // When the order is placed
        case .placeOrder(let dishId): return "/orders/\(dishId)"
            // Fetch dishes in categories
        case .fetchCategoryDishes(let categoryId): return "/dishes/\(categoryId)"
            // Fetches order
        case .fetchOrders: return "/orders"
//        case .temp return "/dishes-cat1"
        }
    }
}

