//
//  PlaylistTarget.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

/// This is the enum used to fetch Playlist request .
enum PlaylistTarget {
    case fetchPlaylistEpisodes(id: String)
}

extension PlaylistTarget: APITarget {
    var path: String {
        switch self {
        case .fetchPlaylistEpisodes(let id):
            return "api/playlist/\(id)"
        }
    }
}
