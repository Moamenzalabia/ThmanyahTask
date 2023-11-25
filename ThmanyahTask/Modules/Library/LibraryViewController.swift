//
//  LibraryViewController.swift
//  ThmanyahTask
//
//  Created Moamen on 24/11/2023.
//  Copyright © 2023 Moamen, Co. Ltd. All rights reserved.
//

import UIKit
import UtilitiesKit
import DesignSystem
import EasyConstraints

class LibraryViewController: BaseViewController {
    
    // MARK: - Properties
    var interactor: LibraryInteractorProtocol?
    var router: LibraryRouterProtocol?
    
    // MARK: - Computed Variables
    private lazy var changeLanguagenButton: Button = {
        let button = Button(theme: .primary, size: .large, state: .enabled)
        button.addTarget(self, action: #selector(changeLanguageButtonDidTap), for: .touchUpInside)
        button.setTitle("change_language_key".localized, for: .normal)
        return button
    }()
    
    private lazy var disabledButton: Button = {
        let button = Button(theme: .primary, size: .large, state: .disabled)
        button.addTarget(self, action: #selector(disabledButtonDidTap), for: .touchUpInside)
        button.setTitle("Disabled", for: .normal)
        return button
    }()
    
    private lazy var enabledButton: Button = {
        let button = Button(theme: .primary, size: .large, state: .enabled)
        button.addTarget(self, action: #selector(enabledButtonDidTap), for: .touchUpInside)
        button.setTitle("Enabled", for: .normal)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [enabledButton, disabledButton, changeLanguagenButton])
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func setupSubViews() {
        super.setupSubViews()
        view.addSubview(buttonsStackView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        buttonsStackView.anchor(
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            padding: UIPadding(left: 20, right: 20))
        buttonsStackView.centerVertically()
    }
    override func setupLocalization() {
        super.setupLocalization()
        navigationItem.title = "library_key".localized
    }
}

// MARK: - View controller lifecycle methods
extension LibraryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions
extension LibraryViewController {
}

// MARK: - Selectors
extension LibraryViewController {
    @objc private func disabledButtonDidTap() {
        disabledButton.changeState(to: .enabled)
    }
    
    @objc private func enabledButtonDidTap() {
        if enabledButton.isAnimating {
            enabledButton.stopAnimating()
            return
        }
        enabledButton.startAnimating()
    }
    
    @objc private func changeLanguageButtonDidTap() {
        changeLanguage()
    }
}

// MARK: - Private Methods
extension LibraryViewController {
    private func changeLanguage() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Protocal
extension LibraryViewController: LibraryViewProtocol {
}
