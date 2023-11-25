//
//  HomeViewModel.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import UtilitiesKit

class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Private Variables
    private var dataSource: [HomePlaylistViewModel] = []
    
    // MARK: - Public Methods
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(at section: Int) -> Int {
        dataSource.count
    }
    
    func headerHeightInSection(at section: Int) -> CGFloat {
        return 0
    }
    
    func footerHeightInSection(at section: Int) -> CGFloat {
        return 0
    }
    
    func rowHeightInSection(at indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func setupDataSource(viewModels: [HomePlaylistViewModel]?) {
        dataSource = viewModels ?? []
    }
    
    func dataSourceForIndex(at indexPath: IndexPath) -> HomePlaylistViewModel? {
        return dataSource[indexPath.row]
    }
}
