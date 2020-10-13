//
//  BlitzBIEventRepository.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>
#import <BlitzRequestBuilder.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBIEventRepository : NSObject
@property NSNumber* appId;
@property NSString* appToken;
@property id <PBlitzDataTransferService> networkService;

- (void)processJsonRequest:(NSString*)url withData: (NSData*)data withCompletion:(void(^)(NSObject *, NSError *))completion;
- (void)processJsonRequestWithoutResponse:(NSString*)url withData: (NSData*)data withIsEmergency:(BOOL)isEmergency;
@end

NS_ASSUME_NONNULL_END
