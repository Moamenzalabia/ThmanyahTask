//
//  HomeRouter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit

class HomeRouter {
    
    private weak var viewController: UIViewController?
    
    private init () {}
    
    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewController(nibName: nil, bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter(with: view)
        let presenter = HomePresenter(interface: view)
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        interactor.repository = HomeRepository()
        view.tabBarItem = UITabBarItem(
            title: "home_key".localized,
            image: UIImage(named: "home_icon"),
            selectedImage: UIImage(named: "home_icon"))
        return view
    }
}

// MARK: - Protocal
extension HomeRouter: HomeRouterProtocol {
    func naviagteToPlayList(playlistId: String?) {
        let navigation = PlaylistRouter.initModule(playlistId: playlistId)
        viewController?.navigationController?.pushViewController(navigation, animated: true)
    }
}
