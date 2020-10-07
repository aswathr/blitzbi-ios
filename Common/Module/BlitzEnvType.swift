//  Converted to Swift 5.2 by Swiftify v5.2.23024 - https://swiftify.com/
//
//  EnvType.h
//  ArVideoDemo
//
//  Created by Vikram on 01/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

import Foundation

public class BaseUrls {
    public var _BASE_URL: String;
    
    init(_BASE_URL: String) {
        self._BASE_URL = _BASE_URL
    }
}

@objc public enum BlitzEnvType : NSInteger {
    case qa = 0
    case prod = 1
    case dev = 2
    case stage = 3
    case local = 4

    func getBaseUrls() -> BaseUrls {
        var _BASE_URL:String!
        switch (self) {
            case .local:
                _BASE_URL = "http://localhost:9000";
                break;
                
            case .prod:
                break;
            case .qa:
                break;
            case .dev:
                break;
            case .stage:
                break;
        }
        
        return BaseUrls(_BASE_URL: _BASE_URL)
    }
}
