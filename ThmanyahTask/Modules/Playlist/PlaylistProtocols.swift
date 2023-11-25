//
//  PlaylistProtocols.swift
//  ThmanyahTask
//
//  Created Moamen on 25/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation


// MARK: - ViewController -> Interactor
protocol PlaylistInteractorProtocol: AnyObject {
    func fetchPlaylist(id: String)
}

// MARK: - Interactor -> Presenter
protocol PlaylistPresenterProtocol: AnyObject {
    func didFetchPlaylist(with entity: PlaylistDataEntity?)
    func didFetchPlaylistError(with errorMessage: String?)
}

// MARK: - Presenter -> ViewCotroller
protocol PlaylistViewProtocol: AnyObject {
    func didFetchPlaylist(with playlist: PlaylistViewModel?, with episodes: [EpisodeViewModel]?)
    func didFetchPlaylistError(with message: String)
}

// MARK: - Router
protocol PlaylistRouterProtocol: AnyObject {
}

protocol PlaylistTableViewHeaderProtocol: AnyObject {
    func playlistFavoritButtonDidTap(with playlist: PlaylistViewModel?)
    func playlistMenuButtonDidTap(with playlist: PlaylistViewModel?)
    func playlistPlayButtonDidTap(with playlist: PlaylistViewModel?)
    func playlistDownloadButtonDidTap(with playlist: PlaylistViewModel?)
    func playlistPlayingTypeButtonDidTap(with playlist: PlaylistViewModel?)
    func playlistBackArrowButtonDidTap()
}

protocol EpisodeTableViewCellProtocol: AnyObject {
    func episodePlayButtonDidTap(with episode: EpisodeViewModel?)
    func episodeMenuButtonDidTap(with episode: EpisodeViewModel?)
}

protocol PlaylistListViewModelProtocol {
    func numberOfSection() -> Int
    func numberOfRowsInSection(at section: Int) -> Int
    func headerHeightInSection(at section: Int) -> CGFloat
    func footerHeightInSection(at section: Int) -> CGFloat
    func rowHeightInSection(at indexPath: IndexPath) -> CGFloat
    func setupDataSource(playlistViewModel: PlaylistViewModel?, episodeViewModels: [EpisodeViewModel]?)
    func dataSourceForSectionHeader(at section: Int) -> PlaylistViewModel?
    func dataSourceForIndex(at indexPath: IndexPath) -> EpisodeViewModel?
}
