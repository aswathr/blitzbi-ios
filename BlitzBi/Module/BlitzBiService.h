//
//  BlitzBiService.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <BaseUrls.h>
#import <BlitzRequestBuilder.h>
#import <BiDeviceRequest.h>
#import <PBlitzDataTransferService.h>
#import <BlitzBiEventSendHandler.h>
#import <BlitzNetworkModuleBuilder.h>
#import <BlitzBiConstants.h>
#import <BlitzBIEventHandlerBuilder.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiService : NSObject {
    NSString* baseUrl;
    BaseUrls* baseUrls;
    id <PBlitzDataTransferService> biNetworkService;
    BlitzBiEventSendHandler* biBuilder;
}

-(void)setUp:(NSNumber*)appId
            :(NSString*)appToken;
-(void)sendEvent:(NSDictionary*)eventDict;
-(void)sendEvents:(NSArray*)events;
@end

NS_ASSUME_NONNULL_END
