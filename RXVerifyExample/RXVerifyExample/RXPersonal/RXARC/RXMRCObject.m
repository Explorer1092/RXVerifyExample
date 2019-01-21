//
//  RXMRCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCObject.h"
#import "RXMRCUtil.h"


@implementation RXMRCObject

- (void)_foo:(id)x
{
    NSUInteger count = [x retainCount];
    NSLog(@"count in foo method:%zd", count);
}
- (void)test_ns_consumed
{
    NSObject *object = [[NSObject alloc] init];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    
    [self _foo:object];
    
    count = [object retainCount];
    NSLog(@"count before release:%zd", count);
    [object release];
}




@end
