//
//  RXTMOwnershipObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTMOwnershipObject.h"

@implementation RXTMOwnershipObject
- (void)test {
    id obj1 = [NSObject new];
    __weak id obj2 = [NSObject new];
    NSLog(@"obj1:%@, obj2:%@", obj1, obj2);
}
@end
