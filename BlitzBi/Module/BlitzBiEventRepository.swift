//
//  BIEventRepository.swift
//  Bi
//
//  Created by Saurabh on 16/09/20.
//

import Foundation

protocol IBlitzBIEventRepository {
    func processJsonRequestWithoutResponse(url:String, body:Data?, isEmergency:Bool)
    func processJsonRequest(url:String, data:Data?, completionHandler:@escaping(BiResponse?,Error?) -> Void)
}

class BlitzBIEventRepository:IBlitzBIEventRepository {
    private var networkService:PBlitzDataTransferService
    private var appId: Int
    private var appToken: String
    
    init(networkService: PBlitzDataTransferService, appId: Int, appToken: String) {
        self.networkService = networkService
        self.appId = appId
        self.appToken = appToken
    }
    
    func processJsonRequest(url:String, data:Data?, completionHandler:@escaping(BiResponse?,Error?) -> Void) {
        let requestBuilder = BlitzRequestBuilder()
        requestBuilder.method = "POST"
        requestBuilder.baseUrl = url
        requestBuilder.path = "events"
        requestBuilder.contentType = "application/json"
        requestBuilder.httpBody = data
        requestBuilder.reqType = BI_REQUEST
        requestBuilder.headers = getRequestHeaders()

        networkService.executeServerCall(requestBuilder: requestBuilder, type: BiResponse.self, completionBlock: {result in
          switch(result) {
          case .success(let result):
              completionHandler(result,nil)
          case .failure(let error):
              completionHandler(nil,error)
          }
        })
      }
    
    func getRequestHeaders() -> NSMutableDictionary {
        let headers: NSMutableDictionary = [
            "blitzAppId" : String(appId),
            "blitzAppToken" : appToken
        ]
        return headers
    }
    
    func processJsonRequestWithoutResponse(url:String, body:Data?, isEmergency:Bool) {
        let requestBuilder = BlitzRequestBuilder()
        requestBuilder.method = "POST"
        requestBuilder.baseUrl = url
        requestBuilder.path = "events"
        requestBuilder.contentType = "application/json"
        requestBuilder.httpBody = body
        requestBuilder.reqType = BI_REQUEST
        requestBuilder.headers = getRequestHeaders()
        requestBuilder.responseListener = nil
        if (isEmergency  && !Thread.isMainThread) {
          do {
              try NSURLConnection.sendSynchronousRequest(requestBuilder.generateRequest() as URLRequest, returning: nil)
          } catch {
          }
        } else {
          networkService.executeServerCallWithNoCallBack(requestBuilder:requestBuilder)
        }
    }
}
