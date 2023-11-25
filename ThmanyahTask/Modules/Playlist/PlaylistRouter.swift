//
//  PlaylistRouter.swift
//  ThmanyahTask
//
//  Created Moamen on 25/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit

class PlaylistRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func initModule(playlistId: String?) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = PlaylistViewController(nibName: nil, bundle: nil)
        let interactor = PlaylistInteractor()
        let router = PlaylistRouter(with: view)
        let presenter = PlaylistPresenter(interface: view)
        view.interactor = interactor
        view.router = router
        view.playlistId = playlistId
        interactor.presenter = presenter
        interactor.repository = PlaylistRepository()
        return view
    }
}

// MARK: - Protocal
extension PlaylistRouter: PlaylistRouterProtocol {

}
