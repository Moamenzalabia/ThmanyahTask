//
//  BaseViewController.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import UIKit
import UtilitiesKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var activityIndicator: NVActivityIndicatorView = {
        let frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 30, y: (UIScreen.main.bounds.height / 2) - 30, width: 60, height: 60)
        let indicator = NVActivityIndicatorView(frame: frame, type: .ballRotateChase, color: .blackColor)
        return indicator
    }()
    
    // MARK: - Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupSubViews()
        setupConstraints()
        registerCells()
        assignDelegates()
        setupNavigationAppearance()
        fetchNeededData()
        setupLocalization()
    }
    
    // MARK: - Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Methods
    func setupAppearance() {
        view.backgroundColor = .whiteColor
    }
    func setupSubViews() {}
    func setupConstraints() {}
    func fetchNeededData() {}
    func registerCells() {}
    func setupLocalization() {}
    func assignDelegates() {}
    func setupNavigationAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .whiteColor
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.H2,
                NSAttributedString.Key.foregroundColor: UIColor.blackColor
            ]
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.H2,
                NSAttributedString.Key.foregroundColor: UIColor.blackColor
            ]
            appearance.shadowImage = UIImage(color: .whiteColor)
            navigationController?.navigationBar.tintColor = .blackColor
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.tintColor = .blackColor
            navigationController?.navigationBar.backgroundColor = .whiteColor
            navigationController?.navigationBar.shadowImage = UIImage(color: .whiteColor)
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.H2,
                NSAttributedString.Key.foregroundColor: UIColor.blackColor
            ]
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.H2,
                NSAttributedString.Key.foregroundColor: UIColor.blackColor
            ]
        }
        navigationController?.navigationBar.layer.layerShadow(
            color: .blackColor,
            alpha: 0.12,
            x: 0,
            y: 2,
            blur: 4,
            spread: 0)
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIApplication.topMostViewController()?.view.isUserInteractionEnabled = false
            UIApplication.topMostViewController()?.view.addSubview((self.activityIndicator))
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            UIApplication.topMostViewController()?.view.isUserInteractionEnabled = true
        }
    }
}

