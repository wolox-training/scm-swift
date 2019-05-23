//
//  TabBarController.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 22/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change tab bar color
        tabBar.barTintColor = .white

        let library = UINavigationController(rootViewController: LibraryViewController())
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = "Library"
        library.tabBarItem.image = UIImage(named: "ic_library")
        library.tabBarItem.selectedImage = UIImage(named: "ic_library active")
        library.tabBarItem.tag = 0
        
        let wishList = UINavigationController(rootViewController: WishListController()) 
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = "Wishlist"
        wishList.tabBarItem.image = UIImage(named: "ic_wishlist")
        wishList.tabBarItem.selectedImage = UIImage(named: "ic_wishlist active")
        wishList.tabBarItem.tag = 1
        
        let new = UINavigationController(rootViewController: NewController())
        new.tabBarItem = UITabBarItem()
        new.tabBarItem.title = "Add New"
        new.tabBarItem.image = UIImage(named: "ic_add new")
        new.tabBarItem.selectedImage = UIImage(named: "ic_add new active")
        new.tabBarItem.tag = 2
        
        let rentals = UINavigationController(rootViewController: RentalsController())
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = "Rentals"
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals")
        rentals.tabBarItem.selectedImage = UIImage(named: "ic_myrentals active")
        rentals.tabBarItem.tag = 3
        
        let settings = UINavigationController(rootViewController: SettingsController())
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = "Settings"
        settings.tabBarItem.image = UIImage(named: "ic_settings")
        settings.tabBarItem.selectedImage = UIImage(named: "ic_settings active")
        settings.tabBarItem.tag = 4
        
        viewControllers = [library, wishList, new, rentals, settings]
    }
    
}
