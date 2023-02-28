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
    
    var orders: [Orders] = [
//
//        .init(id: "id1", name: "Wilson", food: .init(id: "id1", name: "Mchele", image: "https://picsum.photos/100/200", description: "This is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tasted", calories: 34)),
//        .init(id: "id1", name: "Wilson", food: .init(id: "id1", name: "Mchele", image: "https://picsum.photos/100/200", description: "This is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tasted", calories: 34)),
//        .init(id: "id1", name: "Wilson", food: .init(id: "id1", name: "Mchele", image: "https://picsum.photos/100/200", description: "This is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tastedThis is the best I have ever tasted", calories: 34))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        title = "Orders"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ProgressHUD.show()
        // The table view doesnt load new placed orders when we reload the table view after since it is in the viewdid load, we should do this in the view did appear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fecthOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                // Update orders and reload table view
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: CategoryListViewTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CategoryListViewTableViewCell.cellIdentifier)
    }
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListViewTableViewCell.cellIdentifier, for: indexPath) as! CategoryListViewTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = FoodDetailViewController.instantiate()
        controller.selectedFood = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
