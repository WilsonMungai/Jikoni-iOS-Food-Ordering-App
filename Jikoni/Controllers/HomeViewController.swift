//
//  ViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit

class HomeViewController: UIViewController {
    // Color fb8500
    
    // MARK: - Collection view outlets
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCategoryCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCategoryCollectionView: UICollectionView!
    
    // Food categories values
    var foodCategories: [DishCategory] = [
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        // foodCategoryCollectionView delegate and dataSource
                foodCategoryCollectionView.delegate = self
                foodCategoryCollectionView.dataSource = self
        //
        //        // popularDishesCategoryCollectionView delegate and dataSource
        //        popularDishesCategoryCollectionView.delegate = self
        //        popularDishesCategoryCollectionView.dataSource = self
        //
        //        // chefSpecialCategoryCollectionView delegate and dataSource
        //        chefSpecialCategoryCollectionView.delegate = self
        //        chefSpecialCategoryCollectionView.dataSource = self
        //
                registerCell()
        
        title = "Jikoni"
    }

    // MARK: - Cell Registration
    private func registerCell() {
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier)
    }
}

// MARK: - Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as! FoodCategoryCollectionViewCell
        cell.setup(dish: foodCategories[indexPath.row])
        return cell
    }
    
    
}


