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
    
    // Popular dishes values
    var popularDishes: [PopularDish] = [
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
        .init(id: "id1", name: "ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // foodCategoryCollectionView delegate and dataSource
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
        
        // popularDishesCategoryCollectionView delegate and dataSource
        popularDishesCategoryCollectionView.delegate = self
        popularDishesCategoryCollectionView.dataSource = self
        
        // chefSpecialCategoryCollectionView delegate and dataSource
        chefSpecialCategoryCollectionView.delegate = self
        chefSpecialCategoryCollectionView.dataSource = self
        
        registerCell()
        
        title = "Jikoni"
    }
    
    // MARK: - Cell Registration
    private func registerCell() {
        // Register food category collection view cell
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier)
        
        // Register popular dishes collection view cee
        popularDishesCategoryCollectionView.register(UINib(nibName: PopularDishesCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PopularDishesCollectionViewCell.cellIdentifier)
    }
}

// MARK: - Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            
        case foodCategoryCollectionView:
            return foodCategories.count
            
        case popularDishesCategoryCollectionView:
            return popularDishes.count
            
        default: return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            // Inflating food category collection view cell
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as! FoodCategoryCollectionViewCell
            cell.setup(dish: foodCategories[indexPath.row])
            return cell
            
            // Inflating popular dishes category collection view cell
        case popularDishesCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCollectionViewCell.cellIdentifier, for: indexPath) as! PopularDishesCollectionViewCell
            cell.setup(popularDish: popularDishes[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
       
    }
    
    
}


