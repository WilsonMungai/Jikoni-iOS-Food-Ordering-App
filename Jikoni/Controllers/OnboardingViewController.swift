//
//  OnboardingViewController.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-03-30.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [Onboarding] = []
    
    var currentPage = 0 {
        // Did set to know whether we are in the last page
        didSet {
            // Update the page control with the value of the current page
            pageControl.currentPage = currentPage
            // If we are on the last page we chane button title
            if currentPage == slides.count - 1 {
                // Change the button title when we are at the last page
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                // Otherwise the value of the button should be next
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        setupSlides()
        
        // The page control adapts according to the number of slides we have
        pageControl.numberOfPages = slides.count
        
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupSlides() {
        slides = [
            Onboarding(title: "Delicious Dishes",
                       description: "Exeperience a variety of amazing dishess from different cultures around the world.",
                       image: UIImage(named: "slide2")!),
            Onboarding(title: "World-Class Chefs",
                       description: "Our dishes are Prepared by only the best",
                       image:UIImage(named: "slide1")!)]
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        // If you're on the last page we want to go to the next view
        if currentPage == slides.count - 1 {
            // Move to the next view controller
            let controller = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            
            // Set user defaults
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            // If you're not on the last page we want to go to the next view
            // Increment the value of the page
            currentPage += 1
            // Get the index of the page that we want to slide to
            let indexPath = IndexPath(item: currentPage, section: 0)
            // Scrolls the collection view until the specified item is visible
            collectionView.scrollToItem(at: indexPath,
                                        at: .centeredHorizontally,
                                        animated: true)
        }
    }
}

// MARK: - OnboardingViewController Extension
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // number of slides
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    // data to be shown
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        // populate the cell data with slide information
        cell.setup(slides[indexPath.row])
        return cell
    }
    // Sets the size of the collection view after setting the estimate size to none in the main storyboard
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // Delegate that allows us to know when scroll has occured
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        // gives us the current page
        currentPage = Int(scrollView.contentOffset.x / width)
        // update page controller to the current page
        pageControl.currentPage = currentPage
    }
}
