//
//  APIError.swift
//  ThmanyahTask
//
//  Created by Moamen on 25/11/2023.
//

import Foundation
import UtilitiesKit

enum APIError: LocalizedError, Equatable {
    case noInternetConnectionError
    case notAuthorizedError
    case forBiddenError
    case notFoundError
    case decodingFailedError
    case internalServerError
    case generalError
    case otherError(message: String)

    var errorDescription: String? {
        switch self {
        case .noInternetConnectionError:
            return "no_internet_connection_message_key".localized
        case .notAuthorizedError:
            return "not_authorized_error_message_key".localized
        case .forBiddenError:
            return "for_bidden_error_message_key".localized
        case .notFoundError:
            return "not_found_error_message_key".localized
        case .decodingFailedError:
            return "decoding_failed_error_message_key".localized
        case .internalServerError:
            return "internal_server_error_message_key".localized
        case .generalError:
            return "general_error_message_key".localized
        case .otherError(let message):
            return message
        }
    }
}
