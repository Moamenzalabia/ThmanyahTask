//
//  PlaylistViewController.swift
//  ThmanyahTask
//
//  Created Moamen on 25/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit
import EasyConstraints

class PlaylistViewController: BaseViewController {
    
    // MARK: - Properties
    var interactor: PlaylistInteractorProtocol?
    var router: PlaylistRouterProtocol?
    var playlistId: String?
    private var tableViewHeader = "PlaylistTableViewHeader"
    private var viewModel: PlaylistListViewModelProtocol? = PlaylistListViewModel()
    
    // MARK: - Computed Variables
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .whiteColor
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func assignDelegates() {
        super.assignDelegates()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func registerCells() {
        super.registerCells()
        tableView.register(UINib(nibName: tableViewHeader, bundle: nil), forHeaderFooterViewReuseIdentifier: tableViewHeader)
        tableView.registerCellNib(cellClass: EpisodeTableViewCell.self)
    }
    
    override func setupSubViews() {
        super.setupSubViews()
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        tableView.edgesToSuperView(padding: UIPadding(top: -50))
    }
    
}

// MARK: - View controller lifecycle methods
extension PlaylistViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchApiCall()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Private Methods
extension PlaylistViewController {
    private func fetchApiCall() {
        guard let id = playlistId else { return }
        showLoadingIndicator()
        interactor?.fetchPlaylist(id: id)
    }
}

// MARK: - Protocal's
extension PlaylistViewController: PlaylistViewProtocol {
    func didFetchPlaylist(with playlist: PlaylistViewModel?, with episodes: [EpisodeViewModel]?) {
        hideLoadingIndicator()
        viewModel?.setupDataSource(playlistViewModel: playlist, episodeViewModels: episodes)
        self.tableView.reloadData()
    }
    
    func didFetchPlaylistError(with message: String) {
        hideLoadingIndicator()
        UIAlertController.showAlert(title: "error_title_key".localized, message: message)
    }
}

extension PlaylistViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeader) as? PlaylistTableViewHeader else {
            return nil
        }
        headerView.dataSource = viewModel?.dataSourceForSectionHeader(at: section)
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as EpisodeTableViewCell
        cell.delegate = self
        cell.dataSource = viewModel?.dataSourceForIndex(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel?.footerHeightInSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel?.headerHeightInSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.rowHeightInSection(at: indexPath) ?? 0
    }
}

extension PlaylistViewController: PlaylistTableViewHeaderProtocol {
    func playlistFavoritButtonDidTap(with playlist: PlaylistViewModel?) {
        print("playlistFavoritButtonDidTap")
    }
    
    func playlistMenuButtonDidTap(with playlist: PlaylistViewModel?) {
        print("playlistMenuButtonDidTap")
    }
    
    func playlistPlayButtonDidTap(with playlist: PlaylistViewModel?) {
        print("playlistPlayButtonDidTap")
    }
    
    func playlistDownloadButtonDidTap(with playlist: PlaylistViewModel?) {
        print("playlistDownloadButtonDidTap")
    }
    
    func playlistPlayingTypeButtonDidTap(with playlist: PlaylistViewModel?) {
        print("playlistPlayingTypeButtonDidTap")
    }
    
    func playlistBackArrowButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension PlaylistViewController: EpisodeTableViewCellProtocol {
    func episodePlayButtonDidTap(with episode: EpisodeViewModel?) {
        print("episodePlayButtonDidTap")
    }
    
    func episodeMenuButtonDidTap(with episode: EpisodeViewModel?) {
        print("episodeMenuButtonDidTap")
    }
}
