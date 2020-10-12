//
//  BlitzNetworkDataTransferService.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzNetworkDataTransferService.h"
#import "PBlitzServerConfig.h"
#import "BlitzServerConfig.h"
#import "BlitzServerHandler.h"

@implementation BlitzNetworkDataTransferService

id <PBlitzServerConfig> serverConfig;
id <PServerHandler> serverHandler;

- (instancetype)initWithConfig:(id <PBlitzServerConfig>) serverConfig withhandler:(id <PServerHandler>)serverHandler {
    if (self = [super init]) {
        serverConfig = serverConfig;
        serverHandler = serverHandler;
    }
    return self;
}

- (id <PBlitzServerConfig>)getServerConfig {
    return serverConfig;
}

- (void) setServerConfig:(id <PBlitzServerConfig>)serverConfig {
    serverConfig = serverConfig;
}

- (void) executeServerCallWithNoCallBack:(BlitzRequestBuilder *)requestBuilder {
//    if let serverHandler = BlitzServerHandler.serverHandler() as? BlitzServerHandler {
    //            serverHandler.serverCall(requestBuilder, withCompletionBlock: {(data,error) -> Void in
    //            })
    //        }
}

- (void) executeServerCall:(BlitzRequestBuilder *)requestBuilder withCompletion:(void(^)(NSObject *, NSError *))completion {
    //[serverHandler serverCall:requestBuilder completion: completion];
//    [serverHandler serverCall:requestBuilder completion: completion];
//    _serverHandler.serverCall(requestBuilder, withCompletionBlock: {(data,error) -> Void in
//        var isBlockReturned = false
//        if error == nil && data != nil {
//            if let response:T = try? self.getDecodedObject(data: data!) {
//                completionBlock(Result.success(response))
//                isBlockReturned = true
//            }
//        }
//        else {
//            if data != nil {
//                if let error:BlitzError = try? self.getDecodedObject(data: data!) {
//                    completionBlock(Result.failure(error))
//                     isBlockReturned = true
//                }
//            }
//        }
//        if (!isBlockReturned) {
//            completionBlock(Result.failure(BlitzError(httpStatusCode:500)))
//        }
//    })
    
    //    private func getDecodedObject<T:Decodable>(data:NSObject) throws -> T {
    //        do {
    //            let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
    //            do {
    //                let object = try JSONDecoder().decode(T.self, from: jsonData)
    //                return object
    //            }
    //            catch {
    //                throw(error)
    //            }
    //        }
    //        catch{
    //            throw(error)
    //        }
    //    }
}
@end
