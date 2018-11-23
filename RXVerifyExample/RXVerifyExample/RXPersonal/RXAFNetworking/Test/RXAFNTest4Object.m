//
//  RXAFNTest4Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTest4Object.h"

@interface RXAFNTest4Object ()

@property (nonatomic, assign) int f;

@end

@implementation RXAFNTest4Object

- (void)setA:(int)a
{
    _a = a;
}

- (int)b
{
    return self.a + 1;
}

- (void)setC:(int)c
{
    _c = c;
    self.d = _c + 2;
}

- (void)setE:(int)e
{
    _e = e;
    self.f = _e + 3;
}

+ (NSSet *)keyPathsForValuesAffectingB
{
    return [NSSet setWithObjects:@"a", nil];
}

+ (NSSet *)keyPathsForValuesAffectingD
{
    return [NSSet setWithObjects:@"c", nil];
}

+ (NSSet *)keyPathsForValuesAffectingF
{
    return [NSSet setWithObjects:@"e", nil];
}

@end
