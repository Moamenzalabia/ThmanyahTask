//
//  AppCredentialsManager.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation
import UtilitiesKit

class AppCredentialsManager {
    // MARK: - Properties
    static let shared = AppCredentialsManager()
    
    // MARK: - App Credentials Methods
    func saveUserAccessToken(token: String) {
        let tokenData = Data(token.utf8)
        StorageKeychainManager.shared.save(
            value: tokenData,
            forKey: ConstantsManager.kUserAccessTokenKey) { isDone, status in
                if isDone {
                    print("Saving Access Token Success")
                } else {
                    print("Saving Access Token Error: ", status ?? "")
                }
            }
    }
    
    func deleteUserAccessToken() {
        StorageKeychainManager.shared.delete(
            valueForKey: ConstantsManager.kUserAccessTokenKey) { isDone, status in
                if isDone {
                    print("Delete Access Token Success")
                } else {
                    print("Delete Access Token Error: ", status ?? "")
                }
            }
    }
}
