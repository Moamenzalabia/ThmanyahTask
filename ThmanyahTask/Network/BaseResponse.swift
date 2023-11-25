//
//  BaseResponse.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var data: T?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
