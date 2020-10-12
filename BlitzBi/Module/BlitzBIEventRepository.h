//
//  BlitzBIEventRepository.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import "PBlitzDataTransferService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBIEventRepository : NSObject
@property int* appId;
@property NSString* appToken;
@property id <PBlitzDataTransferService> networkService;
- (void)processJsonRequest:(String*)url withData: (Data*)data withCompletion:(void(^)(NSObject *, NSError *))completion;
- (void)processJsonRequestWithoutResponse:(String*)url withData: (Data*)data withIsEmergency:(Bool*)isEmergency;
@end

NS_ASSUME_NONNULL_END
