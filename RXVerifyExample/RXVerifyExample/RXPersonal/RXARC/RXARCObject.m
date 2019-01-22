//
//  RXARCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCObject.h"

#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"
@implementation RXARCObject
- (void)_foo:(id)x
{
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count _foo_not_attribute:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in _foo_not_attribute:%zd", count);
}

- (void)test
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"start count outside method:%zd", count);
    
    //    [self _foo_have_attribute:object];
    [self _foo:object];
    
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"end count outside method:%zd", count);
}
@end
