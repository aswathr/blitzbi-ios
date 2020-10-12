//
//  BlitzBIEventRepository.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzBIEventRepository.h"

@implementation BlitzBIEventRepository
- (instancetype)init:(int *) appId withToken: (NSString*)appToken withService:(PBlitzDataTransferService*) networkService{
    if (self = [super init]) {
        _appId = appId;
        _appToken = appToken;
        _networkService = networkService;
    }
    return self;
}
- (void)processJsonRequest:(String*)url withData: (Data*)data withCompletion:(void(^)(NSObject *, NSError *))completion{
    RequestBuilder *requestBuilder = [[RequestBuilder alloc] init];
    [requestBuilder setMethod:@"POST"];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:@"events"];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self.networkService executeServerCall:requestBuilder withCompletion: completion]
    
    //        networkService.executeServerCall(requestBuilder: requestBuilder, type: BiResponse.self, completionBlock: {result in
    //          switch(result) {
    //          case .success(let result):
    //              completionHandler(result,nil)
    //          case .failure(let error):
    //              completionHandler(nil,error)
    //          }
    //        })
    
}

- (void)processJsonRequestWithoutResponse:(String*)url withData: (Data*)data withIsEmergency:(Bool*)isEmergency {
    RequestBuilder *requestBuilder = [[RequestBuilder alloc] init];
    [requestBuilder setMethod:@"POST"];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:@"events"];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
//    if (isEmergency  && !Thread.isMainThread) {
//      do {
//          try NSURLConnection.sendSynchronousRequest(requestBuilder.generateRequest() as URLRequest, returning: nil)
//      } catch {
//      }
//    } else {
//          networkService.executeServerCallWithNoCallBack(requestBuilder:requestBuilder)
//    }
}

+ (NSMutableDictionary<NSString *, NSString *>) getRequestHeaders {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:_appId forKey:"blitzAppId"];
    [headers setValue:_appToken forKey:"blitzAppToken"];
    return headers;
}
}
@end
