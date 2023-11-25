//
//  SearchPresenter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

class SearchPresenter {
    
    weak var view: SearchViewProtocol?
    
    init(interface: SearchViewProtocol) {
        self.view = interface
    }
}

// MARK: - Protocol
extension SearchPresenter: SearchPresenterProtocol {
}

// MARK: - Private Methods
extension SearchPresenter {
}

