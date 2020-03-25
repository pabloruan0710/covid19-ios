//
//  PRTabBarViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class PRTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBar()
    }

    
    fileprivate func configureTabBar() {
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        if #available(iOS 13, *) {
            // iOS 13:
            let appearance = tabBar.standardAppearance
            appearance.configureWithOpaqueBackground()
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            tabBar.standardAppearance = appearance
        } else {
            // iOS 12 and below:
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
    }
}
