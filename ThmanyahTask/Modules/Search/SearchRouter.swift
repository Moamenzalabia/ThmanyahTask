//
//  SearchRouter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit

class SearchRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SearchViewController(nibName: nil, bundle: nil)
        let interactor = SearchInteractor()
        let router = SearchRouter(with: view)
        let presenter = SearchPresenter(interface: view)
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        view.tabBarItem = UITabBarItem(
            title: "search_key".localized,
            image: UIImage(named: "search_icon"),
            selectedImage: UIImage(named: "search_icon"))
        return view
    }
}

// MARK: - Protocal
extension SearchRouter: SearchRouterProtocol {

}
