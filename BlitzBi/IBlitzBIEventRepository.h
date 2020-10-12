//
//  IBlitzBIEventRepository.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

@protocol IBlitzBIEventRepository<NSObject>
- (void) processJsonRequestWithoutResponse:(NSString *)url withBody:(Data*) body withEmergency:(Bool*) isEmergency;
- (void) processJsonRequest:(NSString *)url withBody:(Data*) body withEmergency:(Bool*) isEmergency withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock;
@end

