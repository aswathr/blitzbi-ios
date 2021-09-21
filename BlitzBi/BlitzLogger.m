//
//  BlitzLogger.m
//  BlitzBi
//
//  Created by Sriharsha on 21/09/21.
//

#import "BlitzLogger.h"


@implementation BlitzLogger


+ (void)logMessage:(NSString *)message {
    if(blitzLogsEnabled) {
        NSLog(@"%@", message);
    }
}
@end
