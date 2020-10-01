//  Converted to Swift 5.2 by Swiftify v5.2.23024 - https://swiftify.com/
//
//  EnvType.h
//  ArVideoDemo
//
//  Created by Vikram on 01/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//


public class BaseUrls {
    public var _BASE_URL:String;
    public var _SECONDARY_APP_REQUEST_BASE_URL:String;
    public var _MINI_GAME_BASE_URL:String;
    public var _FACE_SWAP_BASE_URL:String;
    public var _ERROR_FREE_REQUEST_BASE_URL:String;
    public var _BI_BASE_URL:String;
    public var _LOGS_BASE_URL:String;
    public var _LOGS_SQS_BASE_URL:String;
    public var _HOST_SERVER_BASE_URL:String;
    public var _BOT_SERVER_BASE_URL:String
    public var _BI_EVENTS_URL:String
    public var _BI_EVENTS_DIRECT_URL:String
    
    init(_BASE_URL: String, _SECONDARY_APP_REQUEST_BASE_URL: String, _MINI_GAME_BASE_URL: String, _FACE_SWAP_BASE_URL: String, _ERROR_FREE_REQUEST_BASE_URL: String, _BI_BASE_URL: String, _LOGS_BASE_URL: String, _LOGS_SQS_BASE_URL: String, _HOST_SERVER_BASE_URL: String, _BOT_SERVER_BASE_URL: String) {
        self._BASE_URL = _BASE_URL
        self._SECONDARY_APP_REQUEST_BASE_URL =  _SECONDARY_APP_REQUEST_BASE_URL
        self._MINI_GAME_BASE_URL =  _MINI_GAME_BASE_URL
        self._FACE_SWAP_BASE_URL =  _FACE_SWAP_BASE_URL
        self._ERROR_FREE_REQUEST_BASE_URL =  _ERROR_FREE_REQUEST_BASE_URL
        self._BI_BASE_URL =  _BI_BASE_URL
        self._LOGS_BASE_URL =  _LOGS_BASE_URL
        self._LOGS_SQS_BASE_URL =  _LOGS_SQS_BASE_URL
        self._HOST_SERVER_BASE_URL =  _HOST_SERVER_BASE_URL
        self._BOT_SERVER_BASE_URL =  _BOT_SERVER_BASE_URL
        self._BI_EVENTS_URL = _BI_BASE_URL+"/batch/logBiEventsV2"
        self._BI_EVENTS_DIRECT_URL = _BI_BASE_URL+"/logBiEvent"
    }
    
}

@objc public enum BlitzEnvType : NSInteger {
    case qa = 0
    case prod = 1
    case prod2 = 2
    case dev = 3
    case stage = 4
    case demo = 5
    case android = 6
    case mercury = 7
    case jupiter = 8
    case local = 9
    case sun = 10
    case venus = 11
    case mars = 12
    case pluto = 13
    case auto = 14
    case webdev = 15

    func getBaseUrls() -> BaseUrls {
        var _BASE_URL:String!
        var _SECONDARY_APP_REQUEST_BASE_URL:String!
        var _MINI_GAME_BASE_URL:String!
        var _FACE_SWAP_BASE_URL:String!
        var _ERROR_FREE_REQUEST_BASE_URL:String!
        var _BI_BASE_URL:String!
        var _LOGS_BASE_URL:String!
        var _LOGS_SQS_BASE_URL:String!
        var _HOST_SERVER_BASE_URL:String!
        var _BOT_SERVER_BASE_URL:String!
        switch (self) {
            case .prod2:
                _BASE_URL = "https://prod2-video-infra.onsequel.com";
                _SECONDARY_APP_REQUEST_BASE_URL = "https://prod2-worker-video-infra.onsequel.com";
                _MINI_GAME_BASE_URL = "https://prod-mini-game.onsequel.com";
                _FACE_SWAP_BASE_URL = "https://prod2-face-swap.onsequel.com";
                _ERROR_FREE_REQUEST_BASE_URL = "https://prod2-worker-video-infra.onsequel.com";
                _BI_BASE_URL = "https://prod2-bi-video-infra.onsequel.com";
                _LOGS_BASE_URL = "https://prod2-bi-logs-video-infra.onsequel.com";
                _LOGS_SQS_BASE_URL = "https://logs-api-prod2-video-infra.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://prod-pn-infra.onsequel.com";
                _BOT_SERVER_BASE_URL = "https://prod2-sequel.onsequel.com";
                break;
                
            case .demo:
                _BASE_URL = "https://video-infra-demo.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-demo.onsequel.com";
                break;
                
            case .stage:
                _BASE_URL = "https://video-infra-stage.onsequel.com";
                _SECONDARY_APP_REQUEST_BASE_URL = "https://video-infra-worker-stage.onsequel.com";
                _MINI_GAME_BASE_URL = "https://mini-game-stage.onsequel.com";
                _FACE_SWAP_BASE_URL = "https://face-swap-stage.onsequel.com";
                _ERROR_FREE_REQUEST_BASE_URL = "https://video-infra-worker-stage.onsequel.com";
                _BI_BASE_URL = "https://video-infra-bi-stage.onsequel.com";
                _LOGS_BASE_URL = "https://video-infra-bi-logs-stage.onsequel.com";
                _LOGS_SQS_BASE_URL = "https://video-infra-logs-api-stage.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://host-stage.onsequel.com";
                break;
                
            case .qa:
                _BASE_URL = "http://video-infra-qa.onsequel.com:9005";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-qa.onsequel.com";
                break;
                
            case .dev:
                _BASE_URL = "https://video-infra-dev.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-dev.onsequel.com";
                break;
                
            case .mercury:
                _BASE_URL = "https://video-infra-mercury.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-mercury.onsequel.com";
                break;
                
            case .android:
                _BASE_URL = "https://video-infra-android.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-android.onsequel.com";
                break;
                
            case .local:
                _BASE_URL = "http://172.16.1.69:9000";
                _HOST_SERVER_BASE_URL = "http://172.16.1.69:9001";
                break;
                
            case .sun:
                _BASE_URL = "https://video-infra-sun.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-sun.onsequel.com";
                
            case .jupiter:
                _BASE_URL = "https://video-infra-jupiter.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-jupiter.onsequel.com";
                break;
                
            case .venus:
                _BASE_URL = "https://video-infra-venus.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-venus.onsequel.com";
                break;
                
            case .mars:
                _BASE_URL = "https://video-infra-mars.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-mars.onsequel.com";
                break;
                
            case .pluto:
                _BASE_URL = "https://video-infra-pluto.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-pluto.onsequel.com";
                break;
            case .auto:
                _BASE_URL = "https://video-infra-auto.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-auto.onsequel.com";
                break;
                
            case .webdev:
                _BASE_URL = "https://video-infra-webdev.onsequel.com";
                _HOST_SERVER_BASE_URL = "https://pubnub-infra-webdev.onsequel.com";
                break;
                
            case .prod:
                break;
        }
        
        if (_BI_BASE_URL == nil) {
            _BI_BASE_URL = _BASE_URL;
        }
        
        if (_LOGS_BASE_URL == nil) {
            _LOGS_BASE_URL = _BI_BASE_URL;
        }
        
        if (_HOST_SERVER_BASE_URL == nil) {
            _HOST_SERVER_BASE_URL = "https://test-host-server.onsequel.com";
        }
        
        if(_BOT_SERVER_BASE_URL == nil) {
            _BOT_SERVER_BASE_URL = "https://prod2-sequel.onsequel.com";
        }

        if (_LOGS_SQS_BASE_URL == nil) {
            _LOGS_SQS_BASE_URL = _BI_BASE_URL;
        }

        if (_ERROR_FREE_REQUEST_BASE_URL == nil) {
            _ERROR_FREE_REQUEST_BASE_URL = _BASE_URL;
        }

        if ( _SECONDARY_APP_REQUEST_BASE_URL == nil) {
            _SECONDARY_APP_REQUEST_BASE_URL = _BASE_URL;
        }

        if (_MINI_GAME_BASE_URL == nil) {
            _MINI_GAME_BASE_URL = _BASE_URL;
        }
        
        if (_FACE_SWAP_BASE_URL == nil) {
            _FACE_SWAP_BASE_URL = _BASE_URL;
        }
        
        
        return BaseUrls(_BASE_URL: _BASE_URL, _SECONDARY_APP_REQUEST_BASE_URL: _SECONDARY_APP_REQUEST_BASE_URL, _MINI_GAME_BASE_URL: _MINI_GAME_BASE_URL, _FACE_SWAP_BASE_URL: _FACE_SWAP_BASE_URL, _ERROR_FREE_REQUEST_BASE_URL: _ERROR_FREE_REQUEST_BASE_URL, _BI_BASE_URL: _BI_BASE_URL, _LOGS_BASE_URL: _LOGS_BASE_URL, _LOGS_SQS_BASE_URL: _LOGS_SQS_BASE_URL, _HOST_SERVER_BASE_URL: _HOST_SERVER_BASE_URL, _BOT_SERVER_BASE_URL: _BOT_SERVER_BASE_URL)
    }
}
