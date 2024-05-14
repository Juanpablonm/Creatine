//
//  Localizable.swift
//  app
//
//
//

import Foundation

enum Localizable {

    enum Alert {
        static let errorTitle = NSLocalizedString("error_title", comment: "Error")
        static let unkownErrorMessage = NSLocalizedString("uknown_error", comment: "Something went wrong")
        static let noInternetTitle = NSLocalizedString("no_internet_title", comment: "No internet connection")
        static let noInternetMessage = NSLocalizedString("no_internet_message", comment: "Please check your internet connection")
        static let maintenanceErrorMessage = NSLocalizedString("error_500_message", comment: "LigaX is in maintenance, please come back later")
    }
}
