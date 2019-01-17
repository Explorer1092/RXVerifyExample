//
//  RXARCPrintMemoryAddressObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCPrintMemoryAddressObject.h"

@implementation RXARCPrintMemoryAddressObject
- (void)test
{
    NSObject *obj = [NSObject new];
    NSLog(@"%p", obj);
    NSLog(@"%p", &obj);
    NSLog(@"123");
    
    NSObject *obj2 = self;
    NSLog(@"%p", self);
    NSLog(@"%p", obj2);
    NSLog(@"%p", &obj2);
    NSLog(@"456");
}
@end
