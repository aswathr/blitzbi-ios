//
//  BlitzNetworkModuleBuilder.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzNetworkModuleBuilder.h"

@implementation BlitzNetworkModuleBuilder
//public static func setParams(baseUrls:BaseUrls, serverHandler:PServerHandler = BlitzServerHandler()) -> BlitzNetworkModuleBuilder {
//    let builder = BlitzNetworkModuleBuilder()
//    builder.baseUrls = baseUrls
//    builder.serverHandler = serverHandler
//    return builder
//}
//
//public func build() -> PBlitzDataTransferService {
//    let serverConfig = BlitzServerConfig()
//    serverConfig.baseUrls =  self.baseUrls
//    let service = BlitzNetworkDataTransferService();
////        service.initWithConfig(serverConfig: serverConfig, serverHandler: serverHandler);
//    return service as PBlitzDataTransferService
//}

- (void)setParams:(BaseUrls*)baseUrls serverHandler: (PServerHandler*)serverHandler {
    _baseUrls = baseUrls;
    _serverHandler = serverHandler;
}

- (id <PBlitzDataTransferService>) build {
    BlitzNetworkDataTransferService* service;
    service = [BlitzNetworkDataTransferService alloc];
    service = [BlitzNetworkDataTransferService init];
    return service;
}
@end
