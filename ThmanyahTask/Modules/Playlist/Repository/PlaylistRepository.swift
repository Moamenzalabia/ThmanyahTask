//
//  PlaylistRepository.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

class PlaylistRepository: PlaylistRepositoryInterface {
    func fetchPlaylist(id: String, completion: @escaping (FetchPlaylistCompletion)) {
        MoyaAPIManager.shared.request(
            apiTarget: PlaylistTarget.fetchPlaylistEpisodes(id: id)
        ) { (response: BaseResponse<PlaylistDataEntity>?, error)  in
            completion(response, error)
        }
    }
}
