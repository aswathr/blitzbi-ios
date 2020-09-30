//
//  Error.swift
//  Networking
//
//  Created by Saurabh on 25/09/20.
//

import Foundation

public struct KiwiError:Codable,Error {
    public var httpStatusCode:Int
    public var errorCode:String?
    public var detail:String?
    public var displayJson:String?
    public var invalidParams = [InvalidParams]()
    
    public init(httpStatusCode:Int) {
        self.httpStatusCode = httpStatusCode
    }
}

public struct InvalidParams:Codable {
    public var errorCode:String?
    public var field:String?
    public var reason:String?
    public var location:String?
    public var detail:String?
    public var displayJson:String?
    public var extraInfoUrl:String?
}

@objc public enum ErrorType : NSInteger {
    case none = 0
    case internet = 1
    case serverTimeout
    case auth
}
