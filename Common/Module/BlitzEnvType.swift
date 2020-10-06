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
    public var _BASE_URL:String;
    public var _ERROR_FREE_REQUEST_BASE_URL:String;
    public var _BI_BASE_URL:String;
    public var _BI_EVENTS_URL:String
    public var _BI_EVENTS_DIRECT_URL:String
    
    init(_BASE_URL: String, _ERROR_FREE_REQUEST_BASE_URL: String, _BI_BASE_URL: String) {
        self._BASE_URL = _BASE_URL
        self._ERROR_FREE_REQUEST_BASE_URL =  _ERROR_FREE_REQUEST_BASE_URL
        self._BI_BASE_URL =  _BI_BASE_URL
        self._BI_EVENTS_URL = _BI_BASE_URL + "/batch/logBiEventsV2"
        self._BI_EVENTS_DIRECT_URL = _BI_BASE_URL + "/logBiEvent"
    }
}

@objc public enum BlitzEnvType : NSInteger {
    case qa = 0
    case prod = 1
    case dev = 3
    case stage = 4
    case local = 9

    func getBaseUrls() -> BaseUrls {
        var _BASE_URL:String!
        var _ERROR_FREE_REQUEST_BASE_URL:String!
        var _BI_BASE_URL:String!
        switch (self) {
            case .stage:
                _BASE_URL = "https://video-infra-stage.onsequel.com";
                _ERROR_FREE_REQUEST_BASE_URL = "https://video-infra-worker-stage.onsequel.com";
                _BI_BASE_URL = "https://video-infra-bi-stage.onsequel.com";
                break;
                
            case .qa:
                _BASE_URL = "http://video-infra-qa.onsequel.com:9005";
                break;
                
            case .dev:
                _BASE_URL = "https://video-infra-dev.onsequel.com";
                break;
                
            case .local:
                _BASE_URL = "http://172.16.1.69:9000";
                break;
                
            case .prod:
                break;
        }
        
        if (_BI_BASE_URL == nil) {
            _BI_BASE_URL = _BASE_URL;
        }
        
        if (_ERROR_FREE_REQUEST_BASE_URL == nil) {
            _ERROR_FREE_REQUEST_BASE_URL = _BASE_URL;
        }
        
        return BaseUrls(_BASE_URL: _BASE_URL, _ERROR_FREE_REQUEST_BASE_URL: _ERROR_FREE_REQUEST_BASE_URL, _BI_BASE_URL: _BI_BASE_URL)
    }
}
