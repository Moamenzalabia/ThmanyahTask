//
//  LoginEntity.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation

struct LoginEntity: Codable {
    let accessToken: String?
    let refreshToken: String?
    let expiresIn: Int?
    let user: UserEntity?
}

struct UserEntity: Codable {
    let email: String?
    let userId: String?
    let verified: Bool?
}
