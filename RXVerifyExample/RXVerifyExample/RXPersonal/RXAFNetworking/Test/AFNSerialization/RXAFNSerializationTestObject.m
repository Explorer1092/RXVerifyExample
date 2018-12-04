//
//  RXAFNSerializationTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/3.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNSerializationTestObject.h"
#import "RXAFURLRequestSerialization.h"
@implementation RXAFNSerializationTestObject
- (void)test1
{
    NSString *v1 = RXAFPercentEscapedStringFromString(@"abc");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"我们");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"我们=kk&abc=一切ok");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"?我们=kk&abc=一切ok");
    NSLog(@"v1:%@", v1);
}

- (void)test2
{
    NSDictionary *dic1 = @{@"abc": @"abc",
                           @"123": @(123)
                           };
    NSString *v1 = RXAFQueryStringFromParameters(dic1);
    NSLog(@"v1:%@", v1);
}
@end
