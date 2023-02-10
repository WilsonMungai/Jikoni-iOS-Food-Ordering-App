//
//  Method.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation
// httpMethod of type String
// Setting this enum as type string, makes it have a value of raw value. So when we call raw value, the string value will be returned
enum Method: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
