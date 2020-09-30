//
//  BIEventRepository.swift
//  Bi
//
//  Created by Saurabh on 16/09/20.
//

import Foundation

protocol IBIEventRepository {
    func processJsonRequestWithoutResponse(url:String, body:Data?, isEmergency:Bool)
    func processJsonRequest(url:String, data:Data?, completionHandler:@escaping(BiResponse?,Error?) -> Void)
}

class BIEventRepository:IBIEventRepository {
    
    private var networkService:PDataTransferService
    
    init(networkService:PDataTransferService) {
        self.networkService = networkService
    }
    
    func processJsonRequest(url:String, data:Data?, completionHandler:@escaping(BiResponse?,Error?) -> Void) {
          let requestBuilder = RequestBuilder()
          requestBuilder.method = "POST"
          let path = ""
          requestBuilder.baseUrl = url
          requestBuilder.path = path
          requestBuilder.contentType = "application/json"
          requestBuilder.httpBody = data
          requestBuilder.reqType = BI_REQUEST
          networkService.executeServerCall(requestBuilder: requestBuilder, type: BiResponse.self, completionBlock: {result in
            switch(result) {
            case .success(let result):
                completionHandler(result,nil)
            case .failure(let error):
                completionHandler(nil,error)
            }
          })
      }
    
    func processJsonRequestWithoutResponse(url:String, body:Data?, isEmergency:Bool) {
        let requestBuilder = RequestBuilder()
        requestBuilder.method = "POST"
        let path = ""
        requestBuilder.baseUrl = url
        requestBuilder.path = path
        requestBuilder.contentType = "application/json"
        requestBuilder.httpBody = body
        requestBuilder.reqType = BI_REQUEST
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
