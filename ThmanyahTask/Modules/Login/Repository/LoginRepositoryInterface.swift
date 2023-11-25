//
//  LoginRepositoryInterface.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation

typealias FetchUserLoginCompletion = ((LoginEntity?, Error?) -> Void)

protocol LoginRepositoryInterface: AnyObject {
    /// Method to request user Login data.
    /// - Parameters:
    ///    - email: user email
    ///    - password: user passowrd
    ///     - completion: An response *LoginEntity*
    func userLogin(parameters: [String: Any], completion: @escaping (FetchUserLoginCompletion))
}
