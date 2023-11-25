//
//  MoyaAPIManager.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import Moya
import Alamofire
import UtilitiesKit

class MoyaAPIManager: MoyaAPIManagerInterface {
    // MARK: - Properties
    static let shared = MoyaAPIManager()
    private let jsonDecoder = JSONDecoder()
    
    // MARK: - Computed Properties
    fileprivate lazy var provider: MoyaProvider<BaseTarget> = {
        return MoyaProvider<BaseTarget>(
            callbackQueue: DispatchQueue.global(qos: .utility),
            plugins: [
                NetworkLoggerPlugin()
            ]
        )
    }()
    
    func request<T>(apiTarget: APITarget, completion: @escaping (BaseResponse<T>?, APIError?) -> Void) where T: Decodable {
        provider.request(BaseTarget(apiTarget: apiTarget).debugLog()) { result in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200...299:
                    DispatchQueue.main.async {
                        do {
                            let decodableResponse = try response.debugLog().map(BaseResponse<T>.self)
                            completion(decodableResponse, nil)
                        } catch {
                            completion(nil, .decodingFailedError)
                        }
                    }
                case 401:
                    completion(nil, .notAuthorizedError)
                case 403:
                    completion(nil, .forBiddenError)
                case 404:
                    completion(nil, .notFoundError)
                case 500...599:
                    completion(nil, .internalServerError)
                default:
                    completion(nil, .generalError)
                }
            case .failure(let error):
                debugPrint("Request Failure Case Error ❌: ", error.localizedDescription)
                DispatchQueue.main.async {
                    if error.errorCode == URLError.Code.notConnectedToInternet.rawValue {
                        completion(nil, .noInternetConnectionError)
                    } else {
                        completion(nil, .otherError(message: error.localizedDescription))
                    }
                }
            }
        }
    }
}

extension TargetType {
    public func debugLog() -> Self {
#if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        print("Base Url =============", baseURL)
        print("Path =================", path)
        print("URL ==================", baseURL, path)
        print("HTTP Method ==========", method.rawValue)
        print("Task =================", task)
        print("Headers ==============", headers ?? "No Headers")
        debugPrint("=======================================")
#endif
        return self
    }
}

extension Response {
    public func debugLog() -> Self {
#if DEBUG
        debugPrint("=======================================")
        do {
            let jsonData = try JSONSerialization.jsonObject(with: self.data)
            debugPrint("Success JSON Data ✅: ", jsonData)
        } catch {
            debugPrint("Error JSON Data ❌: ", error.localizedDescription)
        }
        debugPrint("=======================================")
#endif
        return self
    }
}
