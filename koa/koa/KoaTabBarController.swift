//
//  KoaTabBarController.swift
//  koa
//
//  Created by Daniel Kong on 5/13/18.
//  Copyright © 2018 Daniel Kong. All rights reserved.
//

/**
    Requirement:
        1. Show all favorite movies in a second tab, and persist favorites across app launches.
 */
import Foundation
import UIKit

class KoaTabBarController: UITabBarController {
    
    struct Constant {
        static let movieTab = (title: "Movies", defaultImageName: "movie_default", highlightImageName: "movie_highlight")
        static let favoriteTab = (title: "Favorites", defaultImageName: "heart_default", highlightImageName: "heart_highlight")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let movieTableViewController = MovieTableViewController(type: .search)
        let moviesNav = UINavigationController(rootViewController: movieTableViewController)
        moviesNav.tabBarItem = UITabBarItem(title: Constant.movieTab.title, image: UIImage(named: Constant.movieTab.defaultImageName), selectedImage: UIImage(named: Constant.movieTab.highlightImageName))
        moviesNav.tabBarItem.accessibilityLabel = "Movies Tab Bar"
        moviesNav.tabBarItem.accessibilityIdentifier = "Movies Tab Bar item"
        
        let favTableViewController = MovieTableViewController(type: .list)
        let favoritesNav = UINavigationController(rootViewController: favTableViewController)
        favoritesNav.tabBarItem = UITabBarItem(title: Constant.favoriteTab.title, image:  UIImage(named: Constant.favoriteTab.defaultImageName), selectedImage: UIImage(named: Constant.favoriteTab.highlightImageName))
        favoritesNav.tabBarItem.accessibilityLabel = "Favorites Tab Bar"
        favoritesNav.tabBarItem.accessibilityIdentifier = "Favorites Tab Bar item"
        
        viewControllers = [moviesNav, favoritesNav]
    }
}
