//
//  PlaylistInteractor.swift
//  ThmanyahTask
//
//  Created Moamen on 25/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

class PlaylistInteractor {
    
    var presenter: PlaylistPresenterProtocol?
    var repository: PlaylistRepositoryInterface?
    
}

// MARK: - Protocol
extension PlaylistInteractor: PlaylistInteractorProtocol {
    func fetchPlaylist(id: String) {
        repository?.fetchPlaylist(id: id, completion: { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else {
                self.presenter?.didFetchPlaylistError(with: error?.errorDescription)
                return
            }
            self.presenter?.didFetchPlaylist(with: response.data)
        })
    }
}

// MARK: - Private Methods
extension PlaylistInteractor {
    
}
