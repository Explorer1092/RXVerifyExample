//
//  RXAFNAutoreleasingTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNAutoreleasingTestObject.h"

@implementation RXAFNAutoreleasingTestObject
- (void)test1 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [NSMutableArray array];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    NSLog(@"obj1=%@", obj1);
}
- (void)test2 {
    id __unsafe_unretained obj1 = nil;
    {
        id obj0 = [[NSMutableArray alloc] init];
        [obj0 addObject:@"123"];
        obj1 = obj0;
        NSLog(@"obj0=%@", obj0);
    }
    NSLog(@"obj1=%@", obj1);
}

@end
