//
//  HomeInteractor.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

class HomeInteractor {
    var presenter: HomePresenterProtocol?
    var repository: HomeRepositoryInterface?
}

// MARK: - Protocol
extension HomeInteractor: HomeInteractorProtocol {
    func fetchPlaylists() {
        repository?.fetchPlaylists(completion: { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else {
                self.presenter?.didFetchPlaylistsError(with: error?.errorDescription)
                return
            }
            self.presenter?.didFetchPlaylists(with: response.data)
        })
    }
}

// MARK: - Private Methods
extension HomeInteractor {
}
