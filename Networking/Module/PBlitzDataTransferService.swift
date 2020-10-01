//
//  DataTransferService.swift
//  Networking
//
//  Created by Saurabh on 10/09/20.
//

import Foundation

public protocol PBlitzDataTransferService {
    var serverConfig:PBlitzServerConfig { get set }
    func executeServerCall<T:Decodable>(requestBuilder:BlitzRequestBuilder,type:T.Type, completionBlock:@escaping(Result<T, BlitzKiwiError>) -> Void);
    func executeServerCallWithNoCallBack(requestBuilder:BlitzRequestBuilder)
}

public class BlitzNetworkModuleBuilder {
    private var baseUrls:BaseUrls!
    private var serverHandler:PServerHandler!
    
    public static func setParams(baseUrls:BaseUrls, serverHandler:PServerHandler = BlitzServerHandler()) -> BlitzNetworkModuleBuilder {
        let builder = BlitzNetworkModuleBuilder()
        builder.baseUrls = baseUrls
        builder.serverHandler = serverHandler
        return builder
    }
    
    public func build() -> PBlitzDataTransferService {
        return BlitzNetworkDataTransferService(serverConfig: BlitzServerConfig(baseUrls: self.baseUrls),serverHandler: serverHandler) as PBlitzDataTransferService
    }
}

class BlitzNetworkDataTransferService:NSObject,PBlitzDataTransferService {
    var serverConfig: PBlitzServerConfig
    var serverHandler:PServerHandler
    
    public init(serverConfig:PBlitzServerConfig, serverHandler:PServerHandler) {
        self.serverConfig = serverConfig
        self.serverHandler = serverHandler
        super.init()
    }
    
    public func executeServerCall<T:Decodable>(requestBuilder: BlitzRequestBuilder,type:T.Type,
                                               completionBlock: @escaping(Result<T, BlitzKiwiError>) -> Void) {
        serverHandler.serverCall(requestBuilder, withCompletionBlock: {(data,error) -> Void in
            var isBlockReturned = false
            if error == nil && data != nil {
                if let response:T = try? self.getDecodedObject(data: data!) {
                    completionBlock(Result.success(response))
                    isBlockReturned = true
                }
            }
            else {
                if data != nil {
                    if let error:BlitzKiwiError = try? self.getDecodedObject(data: data!) {
                        completionBlock(Result.failure(error))
                         isBlockReturned = true
                    }
                }
            }
            if (!isBlockReturned) {
                completionBlock(Result.failure(BlitzKiwiError(httpStatusCode:500)))
            }
        })
    }
    
    
    public func executeServerCallWithNoCallBack(requestBuilder: BlitzRequestBuilder) {
        if let serverHandler = BlitzServerHandler.serverHandler() as? BlitzServerHandler {
            serverHandler.serverCall(requestBuilder, withCompletionBlock: {(data,error) -> Void in
            })
        }
    }
    
    private func getDecodedObject<T:Decodable>(data:NSObject) throws -> T {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            do {
                let object = try JSONDecoder().decode(T.self, from: jsonData)
                return object
            }
            catch {
                throw(error)
            }
        }
        catch{
            throw(error)
        }
    }
    
}
