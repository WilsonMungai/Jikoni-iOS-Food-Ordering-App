//
//  ViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-14.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
