//
//  BlitzBiDataHandler.h
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>
#import <BlitzRequestBuilder.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiDataHandler : NSObject {
    NSString* baseUrl;
    id <PBlitzDataTransferService> biNetworkService;
}
- (instancetype)init:(NSString*)baseUrl
                    :(id <PBlitzDataTransferService>)networkService;

- (void) updateDeviceId:(NSString*)appId
                       :(NSString*)appToken
                       :(NSData*) data
                       :(void(^)(NSObject *, NSError *))completionBlock;
- (void) updateAppSpecificDeviceId:(NSString*)appId
                                  :(NSString*)appToken
                                  :(NSData*) data
                                  :(void(^)(NSObject *, NSError *))completionBlock;
- (void) updateAppSpecificUserId:(NSString*)appId
                                :(NSString*)appToken
                                :(NSData*) data
                                :(void(^)(NSObject *, NSError *))completionBlock;
@end

NS_ASSUME_NONNULL_END
