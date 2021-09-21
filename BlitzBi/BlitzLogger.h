//
//  BlitzLogger.h
//  BlitzBi
//
//  Created by Sriharsha on 21/09/21.
//

#import <Foundation/Foundation.h>


static bool blitzLogsEnabled = NO;

@interface BlitzLogger : NSObject
+ (void)logMessage:(NSString *)message;
@end

