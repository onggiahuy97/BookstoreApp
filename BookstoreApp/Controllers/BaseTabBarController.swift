//
//  BaseTabBarController.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/3/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: BooksVC(), title: "Books", imageName: "book"),
            createNavController(viewController: BooksPageController(), title: "Books", imageName: "book"),
            createNavController(viewController: BookSearchController(), title: "Search", imageName: "magnifyingglass"),
        ]
    }
    
    private func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem = UITabBarItem(title: title, image: UIImage.init(systemName: imageName), tag: 0)
        
        viewController.title = title
        viewController.view.backgroundColor = .white
        
        return navController
    }
}
