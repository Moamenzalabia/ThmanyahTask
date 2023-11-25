//
//  PlaylistListViewModel.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import UIKit
import UtilitiesKit

class PlaylistListViewModel: PlaylistListViewModelProtocol {
    // MARK: - Private Variables
    private var headerDataSource: PlaylistViewModel?
    private var episodeDataSource: [EpisodeViewModel] = []
    
    // MARK: - Public Methods
    func numberOfSection() -> Int {
        guard headerDataSource != nil else {
            return 0
        }
        return 1
    }
    
    func numberOfRowsInSection(at section: Int) -> Int {
        return episodeDataSource.count
    }
    
    func headerHeightInSection(at section: Int) -> CGFloat {
        return 400
    }
    
    func footerHeightInSection(at section: Int) -> CGFloat {
        return 0
    }
    
    func rowHeightInSection(at indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func setupDataSource(playlistViewModel: PlaylistViewModel?, episodeViewModels: [EpisodeViewModel]?) {
        headerDataSource = playlistViewModel
        episodeDataSource = episodeViewModels ?? []
    }
    
    func dataSourceForSectionHeader(at section: Int) -> PlaylistViewModel? {
        return headerDataSource
    }
    
    func dataSourceForIndex(at indexPath: IndexPath) -> EpisodeViewModel? {
        return episodeDataSource[indexPath.row]
    }
}
