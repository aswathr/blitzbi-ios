//
//  BlitzLogger.m
//  BlitzBi
//
//  Created by Sriharsha on 21/09/21.
//

#import "BlitzLogger.h"


@implementation BlitzLogger



static bool blitzLogsEnabled = NO;

+ (void)logMessage:(NSString *)message {
    if(blitzLogsEnabled) {
        NSLog(@"%@", message);
    }
}

+ (void)enableLogs {
    blitzLogsEnabled = YES;
}

+ (void)disableLogs {
    blitzLogsEnabled = NO;
}
@end
