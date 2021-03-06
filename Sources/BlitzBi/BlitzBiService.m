//
//  BlitzBiService.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzBiService.h"
#import "BaseUrls.h"
#import "BlitzRequestBuilder.h"
#import "BlitzDeviceRequest.h"
#import "BlitzUserRequest.h"
#import "PBlitzDataTransferService.h"
#import "BlitzBiEventSendHandler.h"
#import "BlitzNetworkModuleBuilder.h"
#import "BlitzConstants.h"
#import "BlitzBiEventHandlerBuilder.h"
#import "BlitzDeviceUtils.h"
#import "BlitzBiDataHandler.h"
#import "BlitzPayerRequest.h"
#import "BlitzTime.h"
#import "BlitzLogger.h"

@interface BlitzBiService()
- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken;
- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken;
- (void)initializeDeviceId:(NSString*)appId
                          :(NSString*)appToken;
- (void)updateAppSpecificDeviceIdentifier;
- (void)updateBlitzUserId;
- (void)updateBlitzPayerData;
- (void)initializeBlitzTime;
@end

@implementation BlitzBiService

+ (BlitzBiService*)sharedService {
    static BlitzBiService *sharedInstance = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[BlitzBiService alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->paramsDictionary = [[NSDictionary alloc] init];
        self->serviceQueue = dispatch_queue_create([@"blitz_srvc_fns_serial" UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)enableLogs {
    [BlitzLogger enableLogs];
}

-(void)disableLogs {
    [BlitzLogger disableLogs];
}

- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking
             :(BOOL)debugEnabled{
    [self disableLogs];
    self->appId = appId;
    self->appToken = appToken;
    self->adTracking = adTracking;
    
    if (debugEnabled) {
        self->baseUrl = @"https://blitzbi-test.useblitz.com/";
    } else {
        self->baseUrl = @"https://prod-blitzbi-infra.useblitz.com/";
    }
    
    self->baseUrls = [[BaseUrls alloc] init:baseUrl];
    
    BlitzNetworkModuleBuilder *networkBuilder = [[BlitzNetworkModuleBuilder alloc] init];
    [networkBuilder setParams:baseUrls serverHandler:[[BlitzServerHandler alloc] init]];
    self->biNetworkService = [networkBuilder build];
    
    BlitzBiEventHandlerBuilder *handlerBuilder = [[BlitzBiEventHandlerBuilder alloc] init];
    [handlerBuilder setParams:[NSNumber numberWithInt:20] withUrl:baseUrl withAppId:appId withAppToken:appToken withService:biNetworkService withAdTracking:adTracking];
    self->biBuilder = [handlerBuilder build];
    
    self->dataHandler = [[BlitzBiDataHandler alloc]initWithBaseUrl:baseUrl andNetworkService:biNetworkService];
    
    [self checkForDeviceId:appId :appToken];
    [self initializeBlitzTime];
    [self getCurrentTimeInternal];
}

- (void)setAppSpecificIdentifier:(NSString*)identifier {
    self->appSpecificDeviceIdentifier = identifier;
    [self updateAppSpecificDeviceIdentifier];
}

- (void)setBlitzUserId:(NSString*)userId {
    self->blitzUserId = userId;
    [self updateBlitzUserId];
}

- (void)setBlitzPayerData:(NSString*)payerData {
    self->blitzPayerData = payerData;
    [self updateBlitzPayerData];
}

- (void)setDeviceId:(NSString*)deviceId {
    self->deviceId = deviceId;
    [self updateDeviceId];
}

- (void)sendEvents:(NSArray*)events{
    if (events) {
        [biBuilder sendEvents:events];
    }
}

- (void)sendEvent:(NSDictionary*)eventDict {
    if (eventDict) {
        [biBuilder sendEvent:eventDict];
    }
}

- (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value {
    NSMutableDictionary *commonParams = [[BlitzDeviceUtils getBlitzCommonParams]mutableCopy];
    [commonParams setValue:value forKey:key];
    [BlitzDeviceUtils setBlitzCommonParam:commonParams];
}


- (void)handleException:(NSException *)exception {
    [self onAppCrash];
}


- (void)onAppCrash {
    if (biBuilder) {
        [biBuilder onAppCrash];
    }
}

- (long)getCurrentTime {
    @try {
        NSDate *date = [server dateWithError:nil];
        if (date) {
            return [[NSNumber numberWithDouble:[date timeIntervalSince1970]] longValue] * 1000;
        }
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:@"[BlitzBi] Error whlle getting getCurrentTime."];
    }
    return 0;
}

- (long)getCurrentTimeInternal {
    @try {
        NSDate *date = [server dateWithError:nil];
        if (!date) {
            date = [NSDate date];
        }
        return [[NSNumber numberWithDouble:[date timeIntervalSince1970]] longValue] * 1000;
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:@"[BlitzBi] Error whlle getting getCurrentTimeInternal."];
        return [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longValue] * 1000;
    }
}

- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId :deviceId];
        [self getAllParams:appId :appToken];
    }  else {
        [self initializeDeviceId:appId :appToken];
    }
}

- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken {
    [self->dataHandler getAllParams:appId :appToken :^(NSObject *response, NSError *err){
        @try {
            if (err == nil && response) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil && jsonData) {
                    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    if (err == nil && dictionary) {
                        self->paramsDictionary = dictionary;
                    }
                }
            }
        } @catch (NSException *err) {
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error whlle getting params with error %@", err]];
        }
    }];
}

- (void)getTimeStamp {
    [BlitzLogger logMessage:@"[BlitzBi][Time] Started fetching  getTimeStamp"];
    [self->dataHandler getTimeStamp:^(NSObject *response, NSError *err){
        @try {
            if (err == nil && response) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil && jsonData) {
                    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    if (err == nil && dictionary) {
                        NSString *epochTime = [dictionary objectForKey:@"epochTime"];
                        NSTimeInterval epochTimeInterval = [epochTime doubleValue];
                        NSDate *tsServerNow = [NSDate dateWithTimeIntervalSince1970:epochTimeInterval];
                        NSDate *tsClientNow = [[NSDate alloc] init];
                        
                        NSTimeInterval offset = [tsServerNow timeIntervalSinceDate:tsClientNow];
                        [self->server setOffset:offset];
                        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Successfully fetched time from getTimeStamp with response %@ and offser %f", jsonData, offset]];
                        return;
                    }
                }
            }
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Error whlle getting getTimeStamp with error %@", err]];
        } @catch (NSException *err) {
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Error whlle getting getTimeStamp with error %@", err]];
        }
    }];
}

- (nullable NSString*) getParamForKey:(NSString*)key
                     withDefaultValue:(NSString*)defaultValue {
    @try {
        if (paramsDictionary && [paramsDictionary valueForKey:key]) {
            return [paramsDictionary valueForKey:key];
        } else {
            return defaultValue;
        }
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while getting Param for key %@", key]];
        return defaultValue;
    }
}

- (void)initializeDeviceId:(NSString*)appId
                          :(NSString*)appToken {
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    BlitzDeviceRequest *deviceRequest = [[BlitzDeviceRequest alloc] init:appId :deviceId :nil :nil];
    NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
    if (adTracking)
        [deviceRequestDict setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
    [deviceRequestDict setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return;
    }
    
    [self->dataHandler updateBlitzDevice:appId :appToken :jsonData :^(NSObject *response, NSError *err){
        @try {
            if (err == nil && response) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil && jsonData) {
                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    if (err == nil && jsonDataDictionary) {
                        NSString *blitzDeviceId = [jsonDataDictionary objectForKey:@"blitzDeviceId"];
                        if (blitzDeviceId) {
                            [BlitzDeviceUtils setBlitzDeviceId:blitzDeviceId];
                            [self->biBuilder setBlitzdeviceId:appId :deviceId];
                            [self updateAppSpecificDeviceIdentifier];
                            [self updateBlitzUserId];
                            [self updateDeviceId];
                            [self getAllParams:appId :appToken];
                            return;
                        }
                    }
                }
            }
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error whlle updating blitz device with error %@", err]];
        } @catch (NSException *err) {
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error whlle updating blitz device with error %@", err]];
        }
    }];
}

- (void)initializeBlitzTime {
    @try {
        self->server = [[BlitzTime alloc] init];
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:@"[BlitzBi] Error whlle initialixing blitz time."];
    }
}


- (void)disconnectBlitzTime {
    @try {
        if (self->server) {
            [self->server disconnect];
        }
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:@"[BlitzBi] Error whlle disconnecting blitz time."];
    }
}

- (void)savePurchaseAsync:(NSString *)produtcId {
    dispatch_async(self->serviceQueue, ^{
        [self savePurchase:produtcId];
    });
}

- (void)savePurchase:(NSString *)productId {
    @try {
        NSString *blitzDeviceId = [BlitzDeviceUtils getBlitzDeviceId];
        NSString *blitzUserId = [BlitzDeviceUtils getBlitzUserId];
        
        NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *receiptData = [NSData dataWithContentsOfURL:receiptURL];
        NSString *receipt = [receiptData base64EncodedStringWithOptions:0];
        
        NSString *presentReceipt = [BlitzDeviceUtils getBlitzAppReceipt];
        Boolean isReceiptChanged = NO;
        if (receipt) {
            if (presentReceipt) {
                isReceiptChanged = ![presentReceipt isEqualToString:receipt];
            }
            else {
                isReceiptChanged = YES;
            }
        }
        if (receipt && isReceiptChanged) {
            NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
            [requestDict setValue:blitzDeviceId forKey:@"appDeviceId"];
            [requestDict setValue:blitzUserId forKey:@"appUserId"];
            if (productId) {
                [requestDict setValue:productId forKey:@"productId"];
            }
            else {
                [requestDict setValue:@"ALL_PRODUCT_ID" forKey:@"productId"];
            }
            [requestDict setValue:receipt forKey:@"receipt"];
        
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestDict options:NSJSONWritingPrettyPrinted error:&error];
            if (error) {
                return;
            }
            [self->dataHandler savePurchaseWithAppId:appId withToken:appToken withData:jsonData andCallback:^(NSObject *response, NSError *err) {
                        @try {
                            if (err == nil && response) {
                                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                                if (err == nil && jsonData) {
                                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                                    if (err == nil && jsonDataDictionary) {
                                        [BlitzDeviceUtils setBlitzAppReceipt:receipt];
                                    }
                                }
                            }
                        } @catch (NSException *ex) {
                            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while tagging purchase with error %@", ex]];
                        }
            }];
        }
    } @catch (NSException *ex) {
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while tagging purchase with error %@", ex]];
    }
}

- (void)updateAppSpecificDeviceIdentifier {
    NSString *blitzDeviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (blitzDeviceId && appSpecificDeviceIdentifier) {
        BlitzDeviceRequest *deviceRequest = [[BlitzDeviceRequest alloc] init:appId :blitzDeviceId :appSpecificDeviceIdentifier :nil];
        NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
        if (adTracking)
            [deviceRequestDict setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
        [deviceRequestDict setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateAppSpecificDeviceIdentifier:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            @try {
                if (err == nil && response) {
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                    if (err == nil && jsonData) {
                        NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                        if (err == nil && jsonDataDictionary) {
                            NSString *appSpecificDeviceId = [jsonDataDictionary objectForKey:@"appSpecificDeviceId"];
                            if (appSpecificDeviceId) {
                                [BlitzDeviceUtils setAppDeviceId:appSpecificDeviceId];
                            }
                        }
                    }
                }
            } @catch (NSException *err) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating app specific device identifier with error %@", err]];
            }
        }];
    }
}

- (void)updateBlitzUserId {
    NSString *blitzDeviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (blitzDeviceId && blitzUserId) {
        BlitzUserRequest *userRequest = [[BlitzUserRequest alloc] init:appId :blitzDeviceId :blitzUserId];
        NSMutableDictionary *userRequestDict = [userRequest dictionary];
        if (adTracking)
            [userRequestDict setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
        [userRequestDict setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateBlitzUser:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            @try {
                if (err == nil && response) {
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                    if (err == nil && jsonData) {
                        NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                        if (err == nil && jsonDataDictionary) {
                            NSString *blitzUserId = [jsonDataDictionary objectForKey:@"blitzUserId"];
                            if (blitzUserId) {
                                [BlitzDeviceUtils setBlitzUserId:blitzUserId];
                            }
                        }
                    }
                }
            } @catch (NSException *err) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating blitz user id with error %@", err]];
            }
        }];
    }
}

- (void)updateDeviceId {
    NSString *blitzDeviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (blitzDeviceId && deviceId) {
        NSString *blitzPartnerDeviceId = [BlitzDeviceUtils getBlitzPartnerDeviceId];
        if (blitzPartnerDeviceId && [blitzPartnerDeviceId isEqualToString:deviceId]) {
            return;
        }
        
        [BlitzDeviceUtils setBlitzPartnerDeviceId:deviceId];
        
        BlitzDeviceRequest *deviceRequest = [[BlitzDeviceRequest alloc] init:appId :blitzDeviceId :appSpecificDeviceIdentifier :deviceId];
        NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
        if (adTracking)
            [deviceRequestDict setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
        [deviceRequestDict setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateDeviceId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            @try {
                if (err == nil && response) {
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                    if (err == nil && jsonData) {
                        NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                        if (err == nil && jsonDataDictionary) {
                            return;
                        }
                    }
                }
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating blitz device id with error %@", err]];
            } @catch (NSException *err) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating blitz device id with error %@", err]];
            }
        }];
    }
}

- (void)updateBlitzPayerData {
    NSString *userId = [BlitzDeviceUtils getBlitzUserId];
    if (!userId) {
        return;
    }
    
    NSString *blitzDeviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (blitzDeviceId && blitzUserId) {
        BlitzPayerRequest *payerRequest = [[BlitzPayerRequest alloc] initWith:userId andPayerData:blitzPayerData];
        NSMutableDictionary *payerRequestDict = [payerRequest dictionary];
        if (adTracking)
            [payerRequestDict setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
        [payerRequestDict setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:payerRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateBlitzPayerData:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            @try {
                if (err == nil && response) {
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                    if (err == nil && jsonData) {
                        NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                        if (err == nil && jsonDataDictionary) {
                            return;
                        }
                    }
                }
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating blitz payer data with error %@", err]];
            } @catch (NSException *err) {
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error while updating blitz payer data with error %@", err]];
            }
        }];
    }
}
@end
