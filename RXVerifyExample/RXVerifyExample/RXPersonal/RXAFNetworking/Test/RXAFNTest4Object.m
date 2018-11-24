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


- (int)b
{
    return self.a + 1;
}
+ (NSSet *)keyPathsForValuesAffectingB
{
    return [NSSet setWithObjects:@"a", nil];
}




- (void)setC:(int)c
{
    _c = c;
    self.d = _c + 2;
}
+ (NSSet *)keyPathsForValuesAffectingD
{
    return [NSSet setWithObjects:@"c", nil];
}



- (void)setE:(int)e
{
    _e = e;
    self.f = _e + 3;
}

+ (NSSet *)keyPathsForValuesAffectingF
{
    return [NSSet setWithObjects:@"e", nil];
}


// 注意这里的区别,g影响h,这里要返回g,并指明是g的变化影响h
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ([key isEqualToString:@"h"]) {
        return [NSSet setWithObject:@"g"];
    }
    
    return [super keyPathsForValuesAffectingValueForKey:key];
}

@end
