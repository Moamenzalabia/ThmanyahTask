//
//  HomeViewController.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit
import EasyConstraints

class HomeViewController: BaseViewController {
    // MARK: - Properties
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    private var viewModel: HomeViewModelProtocol? = HomeViewModel()
    
    // MARK: - Computed Variables
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
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
        tableView.registerCellNib(cellClass: HomeTableViewCell.self)
    }
    
    override func setupSubViews() {
        super.setupSubViews()
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        tableView.edgesToSuperView(padding: UIPadding(top: 16, left: 12, bottom: 16, right: 12))
    }
    
    override func setupLocalization() {
        super.setupLocalization()
        navigationItem.title = "episodes_key".localized
    }
}

// MARK: - View controller lifecycle methods
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchApiCall()
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.isTranslucent = true
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else { return }
            self.tableView.didZoomRotateAnimation()
        }
    }
}

// MARK: - Private Methods
extension HomeViewController {
    private func fetchApiCall() {
        showLoadingIndicator()
        interactor?.fetchPlaylists()
    }
}

extension HomeViewController: HomeViewProtocol {
    func didFetchPlaylists(with viewModels: [HomePlaylistViewModel]?) {
        hideLoadingIndicator()
        viewModel?.setupDataSource(viewModels: viewModels)
        tableView.reloadData()
    }
    
    func didFetchPlaylistsError(with message: String) {
        hideLoadingIndicator()
        UIAlertController.showAlert(title: "error_title_key".localized, message: message)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as HomeTableViewCell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel?.dataSourceForIndex(at: indexPath) else { return }
        router?.naviagteToPlayList(playlistId: model.id)
    }
}
