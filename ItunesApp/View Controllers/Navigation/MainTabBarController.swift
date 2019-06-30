//
//  MainTabBarController.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //checks logged in status of user
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = true
        setupViewControllers()
    }
    
    fileprivate func setupViewControllers() {
        tabBar.unselectedItemTintColor = Service.designGrayColor
        tabBar.tintColor = Service.itunesBaseColor
    }
    
}
