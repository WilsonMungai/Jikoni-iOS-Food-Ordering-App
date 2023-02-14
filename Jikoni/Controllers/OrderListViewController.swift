//
//  OrderListViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-27.
//

import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {

    // MARK: - Table view outlets
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
//        .init(id: "id1", name: "Wilson Mungai", food: .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever haveBest meal you will ever haveBest meal you will ever havevBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever have", calories: 100)),
//        .init(id: "id2", name: "Cheryl Wangui", food: .init(id: "id1", name: "Pilay", image: "https://picsum.photos/100/200", description: "Best meal you will ever haveBest meal you will ever haveBest meal you will ever havevBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever have", calories: 100)),
//        .init(id: "id3", name: "Ilyne Wanjiru", food: .init(id: "id1", name: "Chapati", image: "https://picsum.photos/100/200", description: "Best meal you will ever haveBest meal you will ever haveBest meal you will ever havevBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever have", calories: 100)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fecthOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
            }
        }
    }
    
    // Cell registration
    private func registerCell() {
        tableView.register(UINib(nibName: CategoryListViewTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CategoryListViewTableViewCell.cellIdentifier)
    }
}

// MARK: - Extension
extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    // Returns the number of items 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    // Adds data to a cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListViewTableViewCell.cellIdentifier, for: indexPath) as! CategoryListViewTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    // What happens when a cell is selected
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as! FoodDetailViewController
//        // Populates the detail view with data from the order page
//        controller.selectedFood = orders[indexPath.row].food
//        navigationController?.pushViewController(controller, animated: true)
//        show(controller, sender: self)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = FoodDetailViewController.instantiate()
//        controller.selectedFood = orders[indexPath.row].food
        controller.selectedFood = orders[indexPath.row].food
        navigationController?.pushViewController(controller, animated: true)
//        show(controller, sender: self)
    }
}
