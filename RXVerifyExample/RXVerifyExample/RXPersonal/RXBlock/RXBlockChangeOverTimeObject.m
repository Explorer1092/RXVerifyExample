//
//  RXBlockChangeOverTimeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockChangeOverTimeObject.h"
@interface RXBlockChangeOverTimeObject()
@property (nonatomic, copy) int(^block)(int);
@end
@implementation RXBlockChangeOverTimeObject

- (void)test
{
    int (^block1)(int) = ^int(int m) {
        return m + 1;
    };
    block1(1);
    id idBlock1 = block1;
    NSLog(@"idBlock1 class:%@ %p", NSStringFromClass([idBlock1 class]), idBlock1);
    
    self.block = block1;
    id idSelfBlock = self.block;
    NSLog(@"idSelfBlock class:%@ %p", NSStringFromClass([idSelfBlock class]), idSelfBlock);
    
    
    void (^block2)(void) = ^void(void) {
        NSLog(@"block2");
    };
    block2();
    id idBlock2 = block2;
    NSLog(@"idBlock2 class:%@ %p", NSStringFromClass([idBlock2 class]), idBlock2);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, block2);
    
}
@end
