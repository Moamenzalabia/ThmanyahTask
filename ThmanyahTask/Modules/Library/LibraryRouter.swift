//
//  LibraryRouter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit

class LibraryRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = LibraryViewController(nibName: nil, bundle: nil)
        let interactor = LibraryInteractor()
        let router = LibraryRouter(with: view)
        let presenter = LibraryPresenter(interface: view)
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        view.tabBarItem = UITabBarItem(
            title: "library_key".localized,
            image: UIImage(named: "library_icon"),
            selectedImage: UIImage(named: "library_icon"))
        return view
    }
}

// MARK: - Protocal
extension LibraryRouter: LibraryRouterProtocol {

}
