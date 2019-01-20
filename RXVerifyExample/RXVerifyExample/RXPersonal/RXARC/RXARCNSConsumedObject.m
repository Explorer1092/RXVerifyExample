//
//  RXARCNSConsumedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCNSConsumedObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"
@implementation RXARCNSConsumedObject

- (void)_foo_have_attribute:(id) __attribute((ns_consumed))x
{
#if __has_attribute(ns_consumed)
    NSLog(@"__has_attribute ns_consumed");
#else
    NSLog(@"not __has_attribute ns_consumed");
#endif
    
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count in _foo_have_attribute:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in _foo_have_attribute:%zd", count);
}

- (void)_foo_not_attribute:(id)x
{
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count _foo_not_attribute:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in _foo_not_attribute:%zd", count);
}

- (void)test
{

    
    
    RXARCTmpObject *object = [RXARCTmpObject new];
    
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"start count outside method:%zd", count);
    
    
//    [self _foo_have_attribute:object];
    [self _foo_not_attribute:object];
    
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"end count outside method:%zd", count);
}
@end
