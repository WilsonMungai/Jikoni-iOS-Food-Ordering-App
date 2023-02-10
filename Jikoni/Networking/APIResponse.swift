//
//  APIResponse.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation

// Structure of data reponse from the backend
struct APIResponse <T:Decodable> : Decodable  {
    // Response status: 200/500/404
    let status: Int
    // Show message from the backend
    let message: String?
    // Error message from the backend
    let error: String?
    // Generic to hold data from backend
    let data: T?
}
