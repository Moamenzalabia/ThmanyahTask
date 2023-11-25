//
//  PlaylistPresenter.swift
//  ThmanyahTask
//
//  Created Moamen on 25/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation
import UtilitiesKit

class PlaylistPresenter {
    
    weak var view: PlaylistViewProtocol?
    
    init(interface: PlaylistViewProtocol) {
        self.view = interface
    }
    
}

// MARK: - Protocol
extension PlaylistPresenter: PlaylistPresenterProtocol {
    func didFetchPlaylist(with entity: PlaylistDataEntity?) {
        let playlist = PlaylistViewModel(entity: entity?.playlist)
        let episodes = entity?.episodes?.map { EpisodeViewModel(entity: $0) }
        view?.didFetchPlaylist(with: playlist, with: episodes)
    }
    
    func didFetchPlaylistError(with errorMessage: String?) {
        guard let message = errorMessage  else {
            view?.didFetchPlaylistError(with: "general_error_message_key".localized)
            return
        }
        view?.didFetchPlaylistError(with: message)
    }
}

// MARK: - Private Methods
extension PlaylistPresenter {
    
}

