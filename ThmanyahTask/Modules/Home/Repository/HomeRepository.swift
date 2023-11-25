//
//  HomeRepository.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

class HomeRepository: HomeRepositoryInterface {
    func fetchPlaylists(completion: @escaping (FetchHomePlaylistsCompletion)) {
        MoyaAPIManager.shared.request(
            apiTarget: HomeTarget.fetchPlaylists
        ) { (response: BaseResponse<[HomePlayListEntity]>?, error)  in
            completion(response, error)
        }
    }
}
