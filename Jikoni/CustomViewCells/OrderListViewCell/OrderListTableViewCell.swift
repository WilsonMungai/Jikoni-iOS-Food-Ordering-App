//
//  OrderListTableViewCell.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-28.
//

import UIKit
import Kingfisher

class OrderListTableViewCell: UITableViewCell {
    
    static let identifier = "OrderListTableViewCell"

    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var orderName: UILabel!
    
    
//    func setup(order: Orders) {
//        orderImage.kf.setImage(with: order.food?.image?.asUrl)
//        foodName.text = order.food?.name
//        orderName.text = order.name
//    }
}
