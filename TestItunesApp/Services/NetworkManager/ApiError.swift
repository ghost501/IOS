//
//  ApiError.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation

enum ApiError: Error {
    case unknownError
    case connectionError
    case notFound
    case serverError
    case timeOut
    case badRequest
}

// MARK: - Helpers
extension ApiError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .connectionError:
            return "Удостоверьтесь в подключении к интернету"
        case .notFound:
            return "Ресурс, который вы ищете - не найден. Попробуйте позже"
        case .serverError:
            return "Проблемы на сервере. Попробуйте позже"
        case .timeOut:
            return "Request timed out"
        case .unknownError:
            return "Что-то пошло не так. Попробуйте позже"
        case .badRequest:
            return "Что-то пошло не так. Попробуйте позже"
        }
    }
}
