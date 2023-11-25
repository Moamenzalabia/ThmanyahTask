//
//  MockPlayListDataService.swift
//  ThmanyahTaskTests
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
@testable import ThmanyahTask

typealias FetchPlaylistTestCompletion = ((HomePlayListEntity?, APIError?) -> Void)

class MockPlayListDataService {
    var isTestSuccess = true
    
    func fetchPlaylist(id: String, completion: @escaping (FetchPlaylistTestCompletion)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else {
                return
            }
            if self.isTestSuccess {
                let mockPlaylist = HomePlayListEntity(id: "01GVD0TTY5RRMHH6YMCW7N1H70", type: 2, name: "Test Playlist", description: "Test Playlist Description", image: "https://s3.amazonaws.com/aswaat.com/img/app-assets/playlists-0.png", access: "public", status: "published", episodeCount: 6, episodeTotalDuration: 40816, episodes: [:], createdAt: "2023-03-13T08:19:18.086Z", updatedAt: "2023-03-13T08:19:18.086Z", isDeleted: false, followingCount: 10, userId: "e0e4fc2f-e6c8-415c-a025-79a0c824e39c")
                completion(mockPlaylist, nil)
            } else {
                completion(nil, APIError.decodingFailedError)
            }
        }
    }
}

