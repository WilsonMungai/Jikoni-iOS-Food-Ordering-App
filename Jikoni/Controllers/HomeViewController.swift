//
//  ViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-01-23.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    // Color fb8500
    
    // MARK: - Collection view outlets
    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCategoryCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCategoryCollectionView: UICollectionView!
    
    // Food categories values
    var foodCategories: [FoodCategory] = [
//        .init(id: "id1", name: "Food1", image: "https://picsum.photos/100/200"),
//        .init(id: "id1", name: "Food2", image: "https://picsum.photos/100/200"),
//        .init(id: "id1", name: "Food3", image: "https://picsum.photos/100/200"),
//        .init(id: "id1", name: "Food4", image: "https://picsum.photos/100/200"),
//        .init(id: "id1", name: "Food5", image: "https://picsum.photos/100/200"),
//        .init(id: "id1", name: "Food6", image: "https://picsum.photos/100/200")
    ]
    
    // Popular dishes values
    var popularDishes: [Food] = [
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever haveBest meal you will ever haveBest meal you will ever havevBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever haveBest meal you will ever have", calories: 100),
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
//        .init(id: "id1", name: "Ugali", image: "https://picsum.photos/100/200", description: "Best meal you will ever have", calories: 100),
    ]
    
    var special: [Food] = [
//        .init(id: "id1", name: "Pilau Masala", image: "https://picsum.photos/100/200", description: "Fried Rice", calories: 200),
//        .init(id: "id1", name: "Pilau Masala", image: "https://picsum.photos/100/200", description: "Fried Rice", calories: 200),
//        .init(id: "id1", name: "Pilau Masala", image: "https://picsum.photos/100/200", description: "Fried Rice", calories: 200),
//        .init(id: "id1", name: "Pilau Masala", image: "https://picsum.photos/100/200", description: "Fried Rice", calories: 200),
//        .init(id: "id1", name: "Pilau Masala", image: "https://picsum.photos/100/200", description: "Fried Rice", calories: 200)
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
        
        // Show progress bar
        ProgressHUD.show()
        
        title = "Jikoni"
        
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let allCategories):
                ProgressHUD.dismiss()
                self?.foodCategories = allCategories.categories ?? []
                self?.popularDishes = allCategories.populars ?? []
                self?.special = allCategories.specials ?? []
                
                self?.foodCategoryCollectionView.reloadData()
                self?.popularDishesCategoryCollectionView.reloadData()
                self?.chefSpecialCategoryCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
//                print("Fatal error \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Cell Registration
    private func registerCell() {
        // Register food category collection view cell
        foodCategoryCollectionView.register(UINib(nibName: FoodCategoryCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier)
        
        // Register popular dishes collection view cell
        popularDishesCategoryCollectionView.register(UINib(nibName: PopularDishesCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PopularDishesCollectionViewCell.cellIdentifier)
        
        // Register chef special collection view cell
        chefSpecialCategoryCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.cellIdentifier)
    }
}

// MARK: - Extension Delegate & Datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Returns the number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            
        case foodCategoryCollectionView:
            return foodCategories.count
            
        case popularDishesCategoryCollectionView:
            return popularDishes.count
            
        case chefSpecialCategoryCollectionView:
            return special.count
            
        default: return 0
        }
        
    }
    
    // Inflates the collection view with cells data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            // Inflating food category collection view cell
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as! FoodCategoryCollectionViewCell
            cell.setup(category: foodCategories[indexPath.row])
            return cell
            
            // Inflating popular dishes category collection view cell
        case popularDishesCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCollectionViewCell.cellIdentifier, for: indexPath) as! PopularDishesCollectionViewCell
            cell.setup(popularDish: popularDishes[indexPath.row])
            return cell
            
            // Inflating chef special dishes category collection view cell
        case chefSpecialCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.cellIdentifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setup(specialDish: special[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
       
    }
    
    // Gets the selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Select an item on food category to see a list of food items
        if collectionView == foodCategoryCollectionView {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "FoodCategoryListViewController") as! FoodCategoryListViewController
            controller.category = foodCategories[indexPath.row]
            show(controller, sender: self)
        } else {
            // Select the other two view controllers to see the details for each food
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as! FoodDetailViewController
            
            // Switch case to see which item is selected between the two view controllers
            switch collectionView {
                
            case popularDishesCategoryCollectionView:
                controller.selectedFood = popularDishes[indexPath.row]
                
            case chefSpecialCategoryCollectionView:
                controller.selectedFood = special[indexPath.row]
                
            default: return
            }
            show(controller, sender: self)
        }
    }
    
}


