//
//  BlitzLogger.h
//  BlitzBi
//
//  Created by Sriharsha on 21/09/21.
//

#import <Foundation/Foundation.h>


@interface BlitzLogger : NSObject
+ (void)logMessage:(NSString *)message;
+ (void)enableLogs;
+ (void)disableLogs;
@end

