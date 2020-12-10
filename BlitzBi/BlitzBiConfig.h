//
//  BlitzBiConfig.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzBiConfig : NSObject {
    NSString *BASE_URL;
}

- (instancetype)initWithBaseUrl:(NSString*)baseUrl;
- (NSString*)base_URL;
@end
