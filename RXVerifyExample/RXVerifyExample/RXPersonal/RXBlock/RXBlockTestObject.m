//
//  RXBlockTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockTestObject.h"

@implementation RXBlockTestObject
- (void)mainTest
{
    __block int a = 0;
    for (int i = 0; i < 10000; i++) {
        void (^block)(void) = ^{
            a++;
            NSLog(@"%zd", a);
        };
        block();
    }
}
@end
