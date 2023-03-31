//
//  viewExtension.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-03-06.
//

import UIKit

extension UIView {
    // Variable to hold the corner radius value
    // In order to access this value in the story board we use @iBInspectable
    @IBInspectable var cornerRadius: CGFloat {
        // Return whatever was set as the corner radius
        get {return self.cornerRadius}
        
        // Set the corner radius
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
