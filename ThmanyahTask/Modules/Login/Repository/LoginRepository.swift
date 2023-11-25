//
//  LoginRepository.swift
//  ThmanyahTask
//
//  Created by Moamen on 24/11/2023.
//

import Foundation
import Moya

class LoginRepository: LoginRepositoryInterface {
    
    fileprivate let provider = MoyaProvider<LoginTarget>()
    
    func userLogin(parameters: [String: Any], completion: @escaping (FetchUserLoginCompletion)) {
        provider.request(.login(parameters: parameters)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let decodeResponse = try decoder.decode(LoginEntity.self, from: response.data)
                    self.cacheUserAccessCredential(model: decodeResponse)
                    completion(decodeResponse, nil)
                } catch (let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

// MARK: - Private Methods
extension LoginRepository {
    private func cacheUserAccessCredential(model: LoginEntity) {
        guard let accessToken = model.accessToken else { return }
        AppCredentialsManager.shared.saveUserAccessToken(token: accessToken)
    }
}
