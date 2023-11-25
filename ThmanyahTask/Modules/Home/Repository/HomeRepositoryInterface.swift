//
//  HomeRepositoryInterface.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

typealias FetchHomePlaylistsCompletion = ((BaseResponse<[HomePlayListEntity]>?, APIError?) -> Void)
protocol HomeRepositoryInterface: AnyObject {
    /// Method to request fetching Playlists data.
    /// - Parameters:
    ///     - completion: An response *HomePlayListEntity*
    func fetchPlaylists(completion: @escaping (FetchHomePlaylistsCompletion))
}
