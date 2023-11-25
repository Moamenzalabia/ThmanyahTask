//
//  BaseTarget.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import Moya

class BaseTarget {
    private var apiTarget: APITarget!

    init(apiTarget: APITarget) {
        self.apiTarget = apiTarget
    }
}

extension BaseTarget: TargetType, AccessTokenAuthorizable {
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    var baseURL: URL {
        return apiTarget.baseURL
    }

    var path: String {
        return apiTarget.path
    }

    var method: Moya.Method {
        return apiTarget.method
    }

    var sampleData: Data {
        return apiTarget.sampleData
    }

    var task: Moya.Task {
        return apiTarget.task
    }

    var headers: [String: String]? {
        return apiTarget.headers
    }

    var authorizationType: Moya.AuthorizationType? {
        switch apiTarget.authorizationType {
        case .basic:
            return .basic
        case .bearer:
            return .bearer
        case .custom(let customValue):
            return .custom(customValue)
        default:
            return .none
        }
    }
}
