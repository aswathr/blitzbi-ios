//
//  BaseUrls.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseUrls : NSObject {
    NSString* BASE_URL;
}
- (instancetype)init:(NSString *) baseUrl;
@end

NS_ASSUME_NONNULL_END
