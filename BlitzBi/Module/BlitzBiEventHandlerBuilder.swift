//
//  BIEventHandlerBuilder.swift
//  Bi
//
//  Created by Saurabh on 20/09/20.
//

import Foundation

public class BlitzBIEventHandlerBuilder {
    private var batchSize:Int!
    private var baseUrl:String!
    private var networkService:PBlitzDataTransferService!
    private var appId: Int!
    private var appToken: String!
    
    public static func setParams(batchSize:Int, baseUrl: String, networkService:PBlitzDataTransferService, appId: Int, appToken: String) -> BlitzBIEventHandlerBuilder {
        let builder = BlitzBIEventHandlerBuilder()
        builder.batchSize = batchSize
        builder.baseUrl = baseUrl
        builder.networkService = networkService
        builder.appId = appId
        builder.appToken = appToken
        return builder
    }
    
    public func build() -> PBlitzBiEventSendHandler {
        return BlitzBiEventSendHandler(batchSize: batchSize, baseUrl: baseUrl, eventRepository: BlitzBIEventRepository(networkService: networkService, appId: appId, appToken: appToken))
    }
}

