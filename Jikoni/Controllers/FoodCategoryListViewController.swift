//
//  FoodCategoryListViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-26.
//

import UIKit
import ProgressHUD

class FoodCategoryListViewController: UIViewController {
    
    // MARK: - Table view outlet
    @IBOutlet weak var tableView: UITableView!
    
    var category: FoodCategory!
    
    var categories: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.name
       
        registerCell()
        
        ProgressHUD.show()
        
        // fetch category
        NetworkService.shared.fetchFoodCategories(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dish):
                ProgressHUD.dismiss()
                self?.categories = dish
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Cell Registration
    private func registerCell() {
        tableView.register(UINib(nibName:CategoryListViewTableViewCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: CategoryListViewTableViewCell.cellIdentifier)
    }
}

// MARK: - Table view extension
extension FoodCategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    // Returns the number of items 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    // Adds data to a cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListViewTableViewCell.cellIdentifier,
                                                 for: indexPath) as! CategoryListViewTableViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as! FoodDetailViewController
        controller.selectedFood = categories[indexPath.row]
        show(controller, sender: self)
    }
}
