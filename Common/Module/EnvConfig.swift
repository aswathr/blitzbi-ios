//
//  EnvConfig.swift
//  ArVideoDemo
//
//  Created by Yuva on 17/01/19.

//  Copyright © 2019 Kiwi, Inc. All rights reserved.
//

import Foundation

struct Environment {
    static let INITIAL_ENVIRONMENT = EnvType.qa
    
}

@objc public class EnvConfig : NSObject {
    
    @objc public class func environment() -> EnvType {
        return Environment.INITIAL_ENVIRONMENT
    }
}


