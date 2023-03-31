//
//  KingfisherStringExtension.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-24.
//

import Foundation

// This extension helps us to convert the image url to string using 
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
