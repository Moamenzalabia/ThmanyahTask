//
//  LibraryPresenter.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import Foundation

class LibraryPresenter {
    
    weak var view: LibraryViewProtocol?
    
    init(interface: LibraryViewProtocol) {
        self.view = interface
    }
}

// MARK: - Protocol
extension LibraryPresenter: LibraryPresenterProtocol {
}

// MARK: - Private Methods
extension LibraryPresenter {
}

