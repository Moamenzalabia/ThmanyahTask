//
//  UserSessionManager.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation
import UtilitiesKit

class UserSessionManager {
    // MARK: - Properties
    static let shared = UserSessionManager()
    
    // MARK: - Computed Properties
    var userAccessToken: String? {
        guard let tokenData = StorageKeychainManager.shared.get(
            valueForKey: ConstantsManager.kUserAccessTokenKey) else { return nil }
        return String(data: tokenData, encoding: .utf8)
    }
}
