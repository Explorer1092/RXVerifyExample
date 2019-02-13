//
//  RXMRCUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCUtil.h"

@implementation RXMRCUtil
+ (NSUInteger)objectRetainCount:(id)object
{
    return [object retainCount];
}

+ (void)objectRelease:(id)object
{
    [object release];
}
@end
