//
//  NetworkingConstant.swift
//  Networking
//
//  Created by Saurabh on 26/09/20.
//

import Foundation

@objc class NetworkingConstants: NSObject {
    static let INTERNET_ERROR_TITLE = "Connection Issue"
    static let INTERNET_ERROR_MESSAGE = "Whoops! Looks like there’s an issue with your connection. If the issue persists, please contact us at help@onjoyride.com"
    static let AUTH_ERROR_TITLE = "Uh oh! You’ve been logged out"
    static let AUTH_ERROR_MESSAGE = "Please re-enter your phone number to access your account."
    static let SERVER_TIMEOUT_ERROR_TITLE = "Uh oh.."
    static let SERVER_TIMEOUT_ERROR_MESSAGE = "Err, something's not right. Give us a second 😬"
    static let ERROR_HANDLER_POPUP_VIEW_NAME = "Error_Handler_Popup";
    static let GENERIC_POPUP_TYPE = "popupType";
    static let GENERIC_POPUP_NAME = "popupName";
}
