//
//  UserDefaults.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-03-31.
//

import Foundation

extension UserDefaults {
    private enum userDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            // Gets the value of whether or not the user has onboarded
            bool(forKey: userDefaultsKeys.hasOnboarded.rawValue)
        } set {
            // Set the value
            setValue(newValue, forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
