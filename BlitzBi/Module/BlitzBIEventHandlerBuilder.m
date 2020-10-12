//
//  BlitzBIEventHandlerBuilder.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzBIEventHandlerBuilder.h"

@implementation BlitzBIEventHandlerBuilder
//public static func setParams(batchSize:Int, baseUrl: String, networkService:PBlitzDataTransferService, appId: Int, appToken: String) -> BlitzBIEventHandlerBuilder {
//    let builder = BlitzBIEventHandlerBuilder()
//    builder.batchSize = batchSize
//    builder.baseUrl = baseUrl
//    builder.networkService = networkService
//    builder.appId = appId
//    builder.appToken = appToken
//    return builder
//}
//
//public func build() -> PBlitzBiEventSendHandler {
//    return BlitzBiEventSendHandler(batchSize: batchSize, baseUrl: baseUrl, eventRepository: BlitzBIEventRepository(networkService: networkService, appId: appId, appToken: appToken))
//}
- (void)setParams:(Int*)batchSize
            withUrl: (NSString*)baseUrl
            withAppId:(Int*) appId
            withAppToken:(NSString*) appToken
            withService:(PBlitzDataTransferService*) networkService {
    _batchSize = batchSize;
    _baseUrl = baseUrl;
    _appId = appId;
    _appToken = appToken;
    _networkService = networkService;
}

- (PBlitzBiEventSendHandler*) build {
    PBlitzBiEventSendHandler* sendHandler;
    sendHandler = [BlitzNetworkDataTransferService alloc];
    sendHandler = [BlitzNetworkDataTransferService init];
    return sendHandler;
}

@end
