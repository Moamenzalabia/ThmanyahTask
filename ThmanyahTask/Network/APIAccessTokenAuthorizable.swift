//
//  APIAccessTokenAuthorizable.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

protocol APIAccessTokenAuthorizable {
    /// Represents the authorization header to use for requests.
    var authorizationType: APIAuthorizationType? { get }
}

enum APIAuthorizationType {
    /// The `"Basic"` header.
    case basic

    /// The `"Bearer"` header.
    case bearer

    /// Custom header implementation.
    case custom(customValue: String)

    public var value: String {
        switch self {
        case .basic: return "Basic"
        case .bearer: return "Bearer"
        case .custom(let customValue): return customValue
        }
    }
}
