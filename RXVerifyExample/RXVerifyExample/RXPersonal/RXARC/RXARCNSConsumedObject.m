//
//  RXARCNSConsumedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCNSConsumedObject.h"
#import "RXMRCUtil.h"
@implementation RXARCNSConsumedObject

- (void)foo:(id) __attribute((ns_consumed))x
{
    
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count in foo method:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in foo method:%zd", count);
}

- (void)foo2:(id)x
{
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count foo2 in method:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in foo2 method:%zd", count);
}

- (void)test
{
#if __has_attribute(ns_consumed)
    NSLog(@"__has_attribute ns_consumed");
#else
    NSLog(@"not __has_attribute ns_consumed");
#endif
    NSObject *object = [NSObject new];
    
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"start count outside method:%zd", count);
    
    
//    [self foo:object];
    [self foo2:object];
    
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"end count outside method:%zd", count);
}
@end
