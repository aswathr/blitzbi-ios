//
//  BaseUrls.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseUrls : NSObject {
    NSString* BASE_URL;
}
- (instancetype)initWithBaseUrl:(NSString *) baseUrl;
@end

NS_ASSUME_NONNULL_END
