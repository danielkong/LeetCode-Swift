//
//  tabBarController.swift
//  flickr
//
//  Created by Daniel Kong on 3/15/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//
/**
 Note:
    1. TabBarController
    2. UITabBarControllerDelegate
    3. UINavigationController
 
 */
import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabOne = TableViewController()
        let nav = UINavigationController(rootViewController: tabOne)
//        nav.isNavigationBarHidden = true
        nav.tabBarItem = UITabBarItem(title: "tab 1", image: nil, selectedImage: nil)

        
        let tabTwo = CustomizedCollectionViewController()
        tabTwo.tabBarItem = UITabBarItem(title: "tab 2", image: nil, selectedImage: nil)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 30
//        layout.minimumLineSpacing = 15 // default is 10
        let tabThree = DefaultCollectionViewController(collectionViewLayout: layout)
        tabThree.tabBarItem = UITabBarItem(title: "tab 3", image: nil, selectedImage: nil)
        
        viewControllers = [nav, tabTwo, tabThree]
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("select item: \(viewController.title!)")
    }
}
