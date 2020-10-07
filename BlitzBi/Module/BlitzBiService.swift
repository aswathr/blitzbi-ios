//
//  BlitzBiService.swift
//  BlitzDemo
//
//  Created by Admin on 06/10/20.
//

import Foundation

class BlitzBiService {
    private let baseUrls: BaseUrls
    private let biNetworkService: PBlitzDataTransferService
    private let biBuilder: PBlitzBiEventSendHandler
    private let baseUrl: String = "https://blitzbi-dev.useblitz.com/"
    
    private let BLITZ_DEVICE_ID_KEY: String = "BLITZ_DEVICE_ID_KEY"
    
    init(appId: Int, appToken: String) {
        self.baseUrls = BaseUrls(_BASE_URL: baseUrl)
        self.biNetworkService = BlitzNetworkModuleBuilder.setParams(baseUrls:baseUrls).build()
        self.biBuilder = BlitzBIEventHandlerBuilder.setParams(batchSize: 60, baseUrl: baseUrl, networkService: biNetworkService, appId: appId, appToken: appToken).build()
        
        self.checkForDeviceId(appId: appId, appToken: appToken)
    }
    
    private func checkForDeviceId(appId: Int, appToken: String) {
        if let deviceId = UserDefaults.standard.string(forKey: BLITZ_DEVICE_ID_KEY) {
            biBuilder.setBlitzdeviceId(appId, deviceId)
        }  else {
            initialize(appId: appId, appToken: appToken)
        }
    }
    
    private func initialize(appId: Int, appToken: String) -> Void {
        let deviceId = UUID().uuidString
        let deviceRequest: BiDeviceRequest = BiDeviceRequest(blitzAppId: appId, blitzDeviceId: deviceId)
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(deviceRequest) {
            print(data)
            self.checkForDeviceId(appId: appId, appToken: appToken, data: data) { (response: BiDeviceResponse?, err: Error?) in
                if (err == nil && response?.blitzDeviceId != nil) {
                    UserDefaults.standard.set(response?.blitzDeviceId, forKey: self.BLITZ_DEVICE_ID_KEY)
                    self.biBuilder.setBlitzdeviceId(appId, deviceId)
                }
            }
        }
    }
    
    func checkForDeviceId(appId: Int, appToken: String, data: Data, completionHandler:@escaping(BiDeviceResponse?,Error?) -> Void) {
        let headers = NSMutableDictionary()
        headers["blitzAppId"] = String(appId)
        headers["blitzAppToken"] = appToken
        
        let requestBuilder = BlitzRequestBuilder()
        requestBuilder.method = "POST"
        requestBuilder.baseUrl = baseUrl
        requestBuilder.path = "app/device/update"
        requestBuilder.contentType = "application/json"
        requestBuilder.httpBody = data
        requestBuilder.reqType = BI_REQUEST
        requestBuilder.headers = headers

        biNetworkService.executeServerCall(requestBuilder: requestBuilder, type: BiDeviceResponse.self, completionBlock: {result in
          switch(result) {
          case .success(let result):
              completionHandler(result,nil)
          case .failure(let error):
              completionHandler(nil,error)
          }
        })
    }
    
    func sendEvent(eventDict: [String : Any]?) {
        if (eventDict != nil) {
            biBuilder.sendEvent(eventDict)
        }
    }
    
    func sendEvents(_ events: [[String : Any]]?) {
        if (events != nil) {
            biBuilder.sendEvents(events)
        }
    }
    
//    Start, Crash, Pause.
//    Resume,
//
//    func flushEmergency() {
//        biBuilder.flushEmergency()
//    }
}

public struct BiDeviceRequest: Codable {
    public var blitzAppId: Int
    public var blitzDeviceId: String
    public var installAppVersion: String = "1.0.0"
    public var deviceType: String = "IOS"
}

public struct BiDeviceResponse: Codable {
    public var blitzDeviceId: String
    public var deviceType: String = "IOS"
    public var installAppVersion: String = "1.0.0"
    public var currentAppVersion: String = "1.0.0"
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let blitzDeviceId = try container.decodeIfPresent(String.self, forKey: .blitzDeviceId) {
            self.blitzDeviceId = blitzDeviceId
        } else {
            self.blitzDeviceId = ""
        }
    }
}

public enum DeviceType: NSInteger {
    case ANDROID
    case IOS
    case UNKNOWN
}
