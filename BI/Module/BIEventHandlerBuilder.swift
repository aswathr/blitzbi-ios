//
//  BIEventHandlerBuilder.swift
//  Bi
//
//  Created by Saurabh on 20/09/20.
//

import Foundation

public class BIEventHandlerBuilder {
    
    private var batchSize:Int?
    private var baseUrl:String?
    private var eventsUrl:String?
    private var biEventsDirectUrl:String?
    private var networkService:PDataTransferService!
    
    
    public static func setParams(batchSize:Int, baseUrl: String?, eventsUrl: String?, biEventsDirectUrl: String?,networkService:PDataTransferService) -> BIEventHandlerBuilder {
        let builder = BIEventHandlerBuilder()
        builder.batchSize = batchSize
        builder.baseUrl = baseUrl
        builder.eventsUrl = eventsUrl
        builder.biEventsDirectUrl = biEventsDirectUrl
        builder.networkService = networkService
        return builder
    }
    
    public func build() -> PBiEventSendHandler {
        return BiEventSendHandler(batchSize: batchSize ?? 60, baseUrl: baseUrl, eventsUrl: eventsUrl, biEventsDirectUrl: biEventsDirectUrl, eventRepository: BIEventRepository(networkService: networkService))
    }
}
