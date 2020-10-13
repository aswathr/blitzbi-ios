//
//  BlitzBiEventRepository.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>
#import <BlitzRequestBuilder.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventRepository : NSObject {
    NSNumber* appId;
    NSString* appToken;
    id <PBlitzDataTransferService> networkService;
}
- (instancetype)init:(NSNumber*)appId
                    :(NSString*)appToken
                    :(id <PBlitzDataTransferService>)networkService;
- (void)processJsonRequest:(NSString*)url
                          :(NSData*)data
                          :(void(^)(NSObject *, NSError *))completion;
- (void)processJsonRequestWithoutResponse:(NSString*)url
                                         :(NSData*)data
                                         :(BOOL)isEmergency;
@end

NS_ASSUME_NONNULL_END
