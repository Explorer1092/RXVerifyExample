//
//  RXLogManager.m
//  RXVerifyExample
//
//  Created by ceshi on 2017/11/5.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "RXLogManager.h"

@implementation RXLogManager


- (void)writeToLogTextViewVar:(nonnull NSString *)format, ... {
    
    // 有问题
    va_list argumentList;
    
    va_start(argumentList, format);
    
    NSString *str = [[NSString alloc] initWithFormat:format arguments:argumentList];
    va_end(argumentList);
    NSLog(@"str:%@", str);
}

- (void)writeToLogTextView:(NSString *)string {
    NSThread *thread = [NSThread currentThread];
    NSDate *now = [NSDate new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss SSS"];
    NSString *timeString = [dateFormatter stringFromDate:now];
    NSLog(@"thread:%@", thread);
    NSLog(@"thread:%@", thread);
    NSLog(@"timeString:%@", timeString);
    
//    pthread_t thread_t = pthread_self
}

+ (RXLogManager *)sharedInstance {
    static RXLogManager *instance;
    if (instance == NULL) {
        static dispatch_once_t predicate;
        dispatch_once(&predicate, ^{
            instance = [[RXLogManager alloc] init];
        });
    }
    return instance;
}

@end
