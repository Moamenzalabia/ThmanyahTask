//
//  SearchViewController.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit

class SearchViewController: BaseViewController {
    // MARK: - Properties
    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    
    override func setupLocalization() {
        super.setupLocalization()
        navigationItem.title = "search_key".localized
    }
}

// MARK: - View controller lifecycle methods
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions
extension SearchViewController {
}

// MARK: - Selectors
extension SearchViewController {
}

// MARK: - Private Methods
extension SearchViewController {
}

// MARK: - Protocal
extension SearchViewController: SearchViewProtocol {
}
