//
//  HomeTarget.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

/// This is the enum used to fetch Playlist request .
enum HomeTarget {
    case fetchPlaylists
}

extension HomeTarget: APITarget {
    var path: String {
        switch self {
        case .fetchPlaylists:
            return "api/playlist"
        }
    }
}
