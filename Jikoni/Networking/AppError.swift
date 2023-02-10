//
//  AppError.swift
//  Jikoni
//
//  Created by Wilson Mungai on 2023-02-10.
//

import Foundation

// A specialized error that provides localized messages describing the error and why it occurred.
// Types of errors that might be received
enum AppError: LocalizedError {
    // error to describr invalid url
    case invalidUrl
    // error to describr an error in decoding data
    case errorDecoding
    // error to describr a server error
    case serverError(String)
    // error to describr an unknown error
    case unkownError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "URL isn't valid"
        case .errorDecoding:
            return "Data couldn't be decoded"
        case .serverError(let error):
            return error
        case .unkownError:
            return "The error is unkown"
        }
    }
}
