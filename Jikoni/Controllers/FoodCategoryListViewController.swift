//
//  FoodCategoryListViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-26.
//

import UIKit

class FoodCategoryListViewController: UIViewController {
    
    // MARK: - Collection view outlets
    @IBOutlet weak var tableView: UITableView!
    var category: FoodCategory!
    var categories: [Food] = [
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever haveBest meal you will ever haveBest meal you will ever havevBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever have", calories: 100),
        .init(id: "id1", name: "Mchele", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "Pilau", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "Mboga", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "Chai", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "Sambusa", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.name
        
        registerCell()
    }
    
    // MARK: - Cell Registration
    private func registerCell() {
        tableView.register(UINib(nibName:CategoryListViewTableViewCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: CategoryListViewTableViewCell.cellIdentifier)
    }
}

extension FoodCategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryListViewTableViewCell.cellIdentifier,
                                                 for: indexPath) as! CategoryListViewTableViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
