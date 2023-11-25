//
//  PlaylistRepositoryInterface.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

typealias FetchPlaylistCompletion = ((BaseResponse<PlaylistDataEntity>?, APIError?) -> Void)
protocol PlaylistRepositoryInterface: AnyObject {
    /// Method to request fetching Playlist data.
    /// - Parameters:
    ///    - id: playlist id
    ///     - completion: An response *PlaylistDataEntity*
    func fetchPlaylist(id: String, completion: @escaping (FetchPlaylistCompletion))
}

