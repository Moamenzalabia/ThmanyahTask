//
//  APITarget.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import Moya
import UtilitiesKit

protocol APITarget: APIAccessTokenAuthorizable {
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Moya.Method { get }

    /// Provides stub data for use in testing.
    var sampleData: Data { get }

    /// The type of HTTP task to be performed.
    var task: Task { get }

    /// The type of validation to perform on the request. Default is `.none`.
    var validationType: APIValidation { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

extension APITarget {
    var validationType: APIValidation {
        return .successAndRedirectCodes
    }

    var method: Moya.Method {
        return .get
    }

    var baseURL: URL {
        guard let url = URL(string: ConstantsManager.baseURL) else {
            preconditionFailure("Invalid url")
        }
        return url
    }

    var headers: [String: String]? {
        return setupDefaultHeader()
    }

    var sampleData: Data {
        return Data()
    }

    var authorizationType: APIAuthorizationType? {
        return .bearer
    }

    var task: Task {
        .requestPlain
    }
}

// MARK: - Methods
extension APITarget {
    func setupDefaultHeader() -> [String: String] {
        var headers: [String: String] = [:]
        if let token = UserSessionManager.shared.userAccessToken, !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        headers["Content-Type"] = "application/json"
        headers ["Accept-Language"] = Language.isArabic ? "ar" : "en"
        return headers
    }
}
