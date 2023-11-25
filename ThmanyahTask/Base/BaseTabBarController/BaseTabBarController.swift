//
//  BaseTabBarController.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import UIKit
 import UtilitiesKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupViewControllers()
    }
    
    private func setupAppearance() {
        UITabBar.appearance().backgroundColor = .whiteColor
        UITabBar.appearance().tintColor = .haileyBlueColor
        UITabBar.appearance().unselectedItemTintColor = .chimneySweepColor
        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.H4], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Body1], for: .selected)
        tabBar.addShadowWith(color: .blackColor, radius: 5, opacity: 0.1)
    }
    
    private func setupViewControllers() {
        viewControllers = [
            BaseNavigationController(HomeRouter.initModule()),
            BaseNavigationController(SearchRouter.initModule()),
            BaseNavigationController(LibraryRouter.initModule())
        ]
    }
}
