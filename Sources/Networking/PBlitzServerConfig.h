//
//  PBlitzServerConfig.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BaseUrls.h"

@protocol PBlitzServerConfig <NSObject>
- (BaseUrls*)getBaseUrls;
@end
