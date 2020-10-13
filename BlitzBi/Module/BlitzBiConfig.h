//
//  BiConfig.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzBiConfig : NSObject
@property (nonatomic, strong) NSString *BASE_URL;
- (id)initWithUrl:(NSString*) baseUrl;
- (NSString*)base_URL;
@end
