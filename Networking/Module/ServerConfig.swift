//  Converted to Swift 5.2 by Swiftify v5.2.23024 - https://swiftify.com/
//
//  ServerConfig.m
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//
 
public protocol PServerConfig {
    func getBaseUrls() -> BaseUrls
}

class ServerConfig: PServerConfig {
    private var baseUrls:BaseUrls
    
    init(baseUrls:BaseUrls) {
        self.baseUrls = baseUrls
    }
    
    func getBaseUrls() -> BaseUrls {
        return self.baseUrls
    }
}
