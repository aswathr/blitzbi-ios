//
//  DataTransferService.swift
//  Networking
//
//  Created by Saurabh on 10/09/20.
//

import Foundation

public protocol PDataTransferService {
    var serverConfig:PServerConfig { get set }
    func executeServerCall<T:Decodable>(requestBuilder:RequestBuilder,type:T.Type, completionBlock:@escaping(Result<T, KiwiError>) -> Void);
    func executeServerCallWithNoCallBack(requestBuilder:RequestBuilder)
}

public class NetworkModuleBuilder {
    private var baseUrls:BaseUrls!
    private var serverHandler:PServerHandler!
    
    public static func setParams(baseUrls:BaseUrls, serverHandler:PServerHandler = ServerHandler()) -> NetworkModuleBuilder {
        let builder = NetworkModuleBuilder()
        builder.baseUrls = baseUrls
        builder.serverHandler = serverHandler
        return builder
    }
    
    public func build() -> PDataTransferService {
        return NetworkDataTransferService(serverConfig: ServerConfig(baseUrls: self.baseUrls),serverHandler: serverHandler) as PDataTransferService
    }
}

class NetworkDataTransferService:NSObject,PDataTransferService {
    var serverConfig: PServerConfig
    var serverHandler:PServerHandler
    
    public init(serverConfig:PServerConfig, serverHandler:PServerHandler) {
        self.serverConfig = serverConfig
        self.serverHandler = serverHandler
        super.init()
    }
    
    public func executeServerCall<T:Decodable>(requestBuilder: RequestBuilder,type:T.Type,
                                               completionBlock: @escaping(Result<T, KiwiError>) -> Void) {
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
                    if let error:KiwiError = try? self.getDecodedObject(data: data!) {
                        completionBlock(Result.failure(error))
                         isBlockReturned = true
                    }
                }
            }
            if (!isBlockReturned) {
                completionBlock(Result.failure(KiwiError(httpStatusCode:500)))
            }
        })
    }
    
    
    public func executeServerCallWithNoCallBack(requestBuilder: RequestBuilder) {
        if let serverHandler = ServerHandler.serverHandler() as? ServerHandler {
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
