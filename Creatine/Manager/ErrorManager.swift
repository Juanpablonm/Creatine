//
//  ErrorManager.swift
//  app
//
//
//

import Foundation

enum NetworkError: LocalizedError {
    case internetError
    case generic(Error)
    case genericWithMessage(Error)
    case serverError(ServerError)
    case unknownError
    case errorWithCode(Int?)
    
    static var unknownMessage: String {
        Localizable.Alert.unkownErrorMessage
    }
    
    var errorCode: Int? {
        switch self {
        case .errorWithCode(let code):
            return code
        default:
            return nil
        }
    }
    
    var isNotFoundError: Bool {
        self.errorCode == 404
    }
    
    var isInternetError: Bool {
        switch self {
        case .internetError:
            return true
        default:
            return false
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .internetError:
            return Localizable.Alert.noInternetMessage
        case .generic(let error):
            return error.localizedDescription
        case .genericWithMessage(let error):
            return errorMessageFrom(error: error)
        case .serverError(let serverError):
            guard let message = serverError.message else {
                return Localizable.Alert.unkownErrorMessage
            }
            return message
        case .unknownError:
            return Localizable.Alert.unkownErrorMessage
        case .errorWithCode(let statusCode):
            guard let code = statusCode else {
                return Localizable.Alert.noInternetMessage
            }
            guard code < 500 else {
                return Localizable.Alert.maintenanceErrorMessage
            }
            return Localizable.Alert.unkownErrorMessage
        }
    }
    
    var errorTitle: String {
        switch self {
        case .internetError:
            return Localizable.Alert.noInternetTitle
        case .serverError(let serverError):
            return Localizable.Alert.errorTitle
        case .errorWithCode(let statusCode):
            guard let code = statusCode else {
                return Localizable.Alert.noInternetTitle
            }
            return Localizable.Alert.errorTitle
        default:
            return Localizable.Alert.errorTitle
        }
    }
    
    func errorMessageFrom(error: Error) -> String {
        return Localizable.Alert.unkownErrorMessage
    }
}

protocol ServerError {
    var statusCode: Int? { get set }
    var message: String? { get set }
    var error: String? { get set }
}
