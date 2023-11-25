//
//  MoyaAPIManagerInterface.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import Moya
import Alamofire
import UtilitiesKit

protocol MoyaAPIManagerInterface {
    func request<T>(apiTarget: APITarget, completion: @escaping (BaseResponse<T>?, APIError?) -> Void) where T: Decodable
}
