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
    
    var orders: [Orders] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        title = "Orders"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ProgressHUD.show()
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

// MARK: - Table view extension
extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    // return number of orders
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    // return cell data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListViewTableViewCell.cellIdentifier, for: indexPath) as! CategoryListViewTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    // navigate to order details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsViewController") as? OrderDetailsViewController else {return}
        controller.selectedFood = orders[indexPath.row].dish
        show(controller, sender: self)
    }
}
