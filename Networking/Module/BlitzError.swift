//
//  Error.swift
//  Networking
//
//  Created by Saurabh on 25/09/20.
//

import Foundation

public struct BlitzError:Codable,Error {
    public var httpStatusCode:Int
    public var errorMessage: String?
    
    public init(httpStatusCode:Int) {
        self.httpStatusCode = httpStatusCode
    }
}
