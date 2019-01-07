//
//  RXClassMetaClassTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassMetaClassTestObject.h"
#import "RXClassMetaClassObject.h"
#import "RXClassMetaClassOverrideObject.h"
#import "RXRuntimeUtil.h"
#import <objc/runtime.h>
@implementation RXClassMetaClassTestObject
- (void)mainTest
{
    [self _test];
//    [self _test2];
//    [self _test_override];
}

- (void)_test
{
//    [RXRuntimeUtil printMethodListWithClass:[NSObject class]];
    
    [RXRuntimeUtil printMethodListWithClass:[RXClassMetaClassObject class]];
    [RXRuntimeUtil printMethodListWithClass:[[RXClassMetaClassObject new] class]];
}
- (void)_test2
{
    // 这两个概念怎么有冲突??
//    [RXRuntimeUtil respondsToSelector:nil];
    
    
    [RXClassMetaClassObject print_same_name];
    [[RXClassMetaClassObject new] print_same_name];
}
- (void)_test_override
{
    [RXClassMetaClassOverrideObject class];
    [[RXClassMetaClassOverrideObject new] class];
}
@end
