//
//  LoginTarget.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation
import Moya

enum LoginTarget {
    case login(parameters: [String: Any])
}

extension LoginTarget: TargetType {
    var baseURL: URL {
        let baseUrl = ConstantsManager.baseURL
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    
    var path: String {
        switch self {
        case .login:
            return "api/auth/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
