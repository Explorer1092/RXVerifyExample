//
//  RXAFNTest4Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTest4Object.h"

@implementation RXAFNTest4Object

- (void)setA:(int)a
{
    _a = a;
//    self.b = a + 4;
}

//- (int)b
//{
//    return _b + self.a;
//}

+ (NSSet *)keyPathsForValuesAffectingB
{
    return [NSSet setWithObjects:@"a", nil];
}

@end
