//
//  AppDelegate.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import UIKit
import UtilitiesKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        userLogin(parameters: ["email": "ajbusaleh@gmail.com",  "password": "123123aJ*"])
        self.window = UIWindow()
        self.window?.rootViewController = BaseTabBarController()
        self.window?.makeKeyAndVisible()
        return true
    }
}

// MARK: - Private Methods
extension AppDelegate {
    private func userLogin(parameters: [String : Any]) {
        let repository = LoginRepository()
        repository.userLogin(parameters: parameters, completion: { [weak self] (result, error)in
            guard let self = self else { return }
            guard error == nil else {
                UIAlertController.showAlert(title: "error_title_key".localized, message: error?.localizedDescription ?? "")
                return
            }
        })
    }
}
