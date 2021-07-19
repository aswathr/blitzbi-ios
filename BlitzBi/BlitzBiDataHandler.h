//
//  BlitzBiDataHandler.h
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import <Foundation/Foundation.h>
#import "PBlitzDataTransferService.h"

@class BlitzRequestBuilder;

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiDataHandler : NSObject {
    NSString* baseUrl;
    id <PBlitzDataTransferService> biNetworkService;
}

- (instancetype)initWithBaseUrl:(NSString*)baseUrl
              andNetworkService:(id <PBlitzDataTransferService>)networkService;

- (void)savePurchaseWithAppId:(NSString*)appId withToken:(NSString *)appToken withData:(NSData*)data andCallback:(void(^)(NSObject *, NSError *))completionBlock;

- (void)updateBlitzDevice:(NSString*)appId
                         :(NSString*)appToken
                         :(NSData*) data
                         :(void(^)(NSObject *, NSError *))completionBlock;
- (void)updateAppSpecificDeviceIdentifier:(NSString*)appId
                                         :(NSString*)appToken
                                         :(NSData*) data
                                         :(void(^)(NSObject *, NSError *))completionBlock;
- (void)updateBlitzUser:(NSString*)appId
                       :(NSString*)appToken
                       :(NSData*) data
                       :(void(^)(NSObject *, NSError *))completionBlock;
- (void)updateBlitzPayerData:(NSString*)appId
                            :(NSString*)appToken
                            :(NSData*) data
                            :(void(^)(NSObject *, NSError *))completionBlock;
- (void)updateDeviceId:(NSString*)appId
                      :(NSString*)appToken
                      :(NSData*) data
                      :(void(^)(NSObject *, NSError *))completionBlock;
- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken
                    :(void(^)(NSObject *, NSError *))completionBlock;

- (void)getTimeStamp:(void(^)(NSObject *, NSError *))completionBlock;
@end

NS_ASSUME_NONNULL_END
