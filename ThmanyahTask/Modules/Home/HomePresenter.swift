//
//  HomePresenter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

class HomePresenter {
    weak var view: HomeViewProtocol?
    init(interface: HomeViewProtocol) {
        self.view = interface
    }
}

// MARK: - Protocol
extension HomePresenter: HomePresenterProtocol {
    func didFetchPlaylists(with entity: [HomePlayListEntity]?) {
        let viewModels = entity?.map { HomePlaylistViewModel(entity: $0) }
        view?.didFetchPlaylists(with: viewModels)
    }
    
    func didFetchPlaylistsError(with errorMessage: String?) {
        guard let message = errorMessage  else {
            view?.didFetchPlaylistsError(with: "general_error_message_key".localized)
            return
        }
        view?.didFetchPlaylistsError(with: message)
    }
}

// MARK: - Private Methods
extension HomePresenter {
}
