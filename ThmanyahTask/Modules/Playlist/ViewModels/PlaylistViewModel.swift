//
//  PlaylistViewModel.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import UtilitiesKit

class PlaylistViewModel {
    var id: String?
    var name: String?
    var description: String?
    var episodeCount: Int?
    var episodeCountString: String?
    var imageLink: String?
    var duration: String?
    var playlistTimeCount: String?
    
    // MARK: - Initialization
    init(entity: PlaylistEntity?) {
        id = entity?.id
        name = entity?.name
        description = entity?.description
        episodeCount = entity?.episodeCount
        episodeCountString = "\(entity?.episodeCount ?? 0) \("episode_key".localized)"
        imageLink = entity?.image
        duration = getHoursDuration(seconds: entity?.episodeTotalDuration ?? 0)
        playlistTimeCount = "\(episodeCountString ?? "") . \(duration ?? "")"
    }
    
    // MARK: - Private Methods
    func getHoursDuration(seconds: Int) -> String {
        let duration = seconds.getTimeDuration()
        return "\(duration.hours) \("hours_key".localized)"
    }
}
