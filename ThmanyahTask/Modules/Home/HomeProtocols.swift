//
//  HomeProtocols.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Interactor
protocol HomeInteractorProtocol: AnyObject {
    func fetchPlaylists()
}

// MARK: - Interactor -> Presenter
protocol HomePresenterProtocol: AnyObject {
    func didFetchPlaylists(with entity: [HomePlayListEntity]?)
    func didFetchPlaylistsError(with errorMessage: String?)
}

// MARK: - Presenter -> ViewCotroller
protocol HomeViewProtocol: AnyObject {
    func didFetchPlaylists(with viewModels: [HomePlaylistViewModel]?)
    func didFetchPlaylistsError(with message: String)
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    func naviagteToPlayList(playlistId: String?)
}

protocol HomeViewModelProtocol {
    func numberOfSection() -> Int
    func numberOfRowsInSection(at section: Int) -> Int
    func headerHeightInSection(at section: Int) -> CGFloat
    func footerHeightInSection(at section: Int) -> CGFloat
    func rowHeightInSection(at indexPath: IndexPath) -> CGFloat
    func setupDataSource(viewModels: [HomePlaylistViewModel]?)
    func dataSourceForIndex(at indexPath: IndexPath) -> HomePlaylistViewModel?
}
