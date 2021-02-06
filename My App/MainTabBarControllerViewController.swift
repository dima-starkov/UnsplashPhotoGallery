//
//  MainTabBarControllerViewController.swift
//  My App
//
//  Created by Дмитрий Старков on 23.10.2020.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    let photosVC = PhotosCollectionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    let likesVC = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
   
      viewControllers = [
        generateNavigationContriller(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "imgonline-com-ua-Resize-kVqDtAvF7qvrvU")),
        generateNavigationContriller(rootViewController: likesVC, title: "Favourites", image: #imageLiteral(resourceName: "imgonline-com-ua-Resize-GtzMQGXiiTIbGH"))
      ]
        
    }
    
    private func generateNavigationContriller(rootViewController:UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
            navigationVC.tabBarItem.title = title
            navigationVC.tabBarItem.image = image
        return navigationVC
    }
   

}
