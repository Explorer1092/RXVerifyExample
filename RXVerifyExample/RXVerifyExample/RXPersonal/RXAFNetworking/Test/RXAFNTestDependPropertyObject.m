//
//  RXAFNTestDependPropertyObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/23.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTestDependPropertyObject.h"
#import "RXAFNTest4Object.h"
#import "RXAFNTest5Object.h"
@interface RXAFNTestDependPropertyObject ()

@property (nonatomic, strong) RXAFNTest4Object *test4Object;
@property (nonatomic, strong) RXAFNTest5Object *test5Object;

@end
@implementation RXAFNTestDependPropertyObject
- (id)init
{
    if (self = [super init]) {
        self.test4Object = [RXAFNTest4Object new];
        self.test5Object = [RXAFNTest5Object new];
    }
    return self;
}
- (void)test_dependProperty_A_B {
    [self.test4Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.a = 5;
    });
}
- (void)test_dependProperty_C_D
{
    
    [self.test4Object addObserver:self forKeyPath:@"d" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.c = 5;
    });
}
- (void)test_dependProperty_E_F
{
    
    [self.test4Object addObserver:self forKeyPath:@"f" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.e = 5;
    });
}


- (void)test_dependProperty_G_H
{
    [self.test4Object addObserver:self forKeyPath:@"h" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.g = 5;
    });
}


- (void)test_dependProperty2 {
    //    [self.test5Object addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew context:nil];
    [self.test5Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test5Object.a = 5;
    });
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath:%@, change:%@", keyPath, change);
}
@end
