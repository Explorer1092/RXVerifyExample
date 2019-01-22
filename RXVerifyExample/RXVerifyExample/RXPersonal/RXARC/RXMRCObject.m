//
//  RXMRCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"

@implementation RXMRCObject

- (void)_foo:(id)x
{
    NSUInteger count = [x retainCount];
    NSLog(@"count in foo method:%zd", count);
}
- (void)test
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    
    [self _foo:object];
    
    count = [object retainCount];
    NSLog(@"count before release:%zd", count);
    [object release];
    
    #if __has_feature(objc_arc)
        NSLog(@"ARC");
    #else
        NSLog(@"MRC");
    
    # endif
}




@end
