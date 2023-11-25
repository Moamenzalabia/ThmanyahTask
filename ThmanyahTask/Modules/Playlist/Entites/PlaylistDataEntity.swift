//
//  PlaylistDataEntity.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

struct PlaylistDataEntity: Codable {
    let playlist: PlaylistEntity?
    let episodes: [EpisodesEntity]?
}
