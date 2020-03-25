//
//  FlowApp.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import UIKit

struct FlowApp {
    
    static func startRootView(window: UIWindow?) {
        let tabBar = self.tabBarInit()
        tabBar.setViewControllers(self.makeTabMenu(), animated: false)
        
        Util.apparence(window: window)
        window?.rootViewController = self.makeNavigationBar(root: tabBar)
        window?.makeKeyAndVisible()
    }
    
    private static func tabBarInit() -> UITabBarController {
        return PRTabBarViewController()
    }
    
    // MARK: -ViewControllers
    private static func homeView() -> PRViewController {
        let viewModel = HomeViewModel()
        let home = HomeViewController(viewModel: viewModel)
        home.tabBarItem = self.makeTabBarButton(image: "global", tag: 1)
        return home
    }
    
    private static func paisView() -> PRViewController {
        let viewModel = PaisViewModel()
        let home = PaisViewController(viewModel: viewModel)
        //let titulo: String = "Pais Usuario"
        home.tabBarItem = self.makeTabBarButton(titulo: nil, image: "flag", tag: 2)
        return home
    }
    
    private static func noticiasView() -> PRViewController {
        let viewModel = NoticiasViewModel()
        let home = NoticiasViewController(viewModel: viewModel)
        home.tabBarItem = self.makeTabBarButton(titulo: nil, image: "news", tag: 3)
        return home
    }
    
    private static func dicasView() -> PRViewController {
        let viewModel = DicasViewModel()
        let home = DicasViewController(viewModel: viewModel)
        home.tabBarItem = self.makeTabBarButton(titulo: nil, image: "dicas", tag: 4)
        return home
    }
    
    // MARK: Constructors
    
    private static func makeTabBarButton(titulo: String? = nil, image: String, tag: Int) -> UITabBarItem {
        let barbutton = UITabBarItem(title: titulo?.localized, image: UIImage(named: image), tag: tag)
        barbutton.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        return barbutton
    }
    
    private static func makeNavigationBar(root: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: root)
        nav.navigationBar.isHidden = true
        return nav
    }
    
    static func makeTabMenu() -> [PRViewController] {
        // Checca se selecionou Pais, caso não
        // ocultar menu pais
        let menu1 = homeView()
        let menu2 = paisView()
        let menu3 = noticiasView()
        let menu4 = dicasView()
        
        return [menu1, menu2, menu3, menu4]
    }
    
}

