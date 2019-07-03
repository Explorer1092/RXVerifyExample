//
//  RXPCQueueBufferManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCQueueBufferManager.h"
#import "RXPCQueueBuffer.h"
@interface RXPCQueueBufferManager ()

@property (nonatomic, strong) RXPCQueueBuffer *queueBuffer;

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@end

@implementation RXPCQueueBufferManager

- (void)test {
    [self producer];
    [self consumer];
}
- (void)producer {
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i < 10; i++) {
        dispatch_async(self.concurrentQueue, ^{
             [weakSelf.queueBuffer push:@(i)];
        });
    }
}
- (void)consumer {
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i < 10; i++) {
        dispatch_async(self.concurrentQueue, ^{
            id value = [weakSelf.queueBuffer pop];
            NSLog(@"consumer value:%@", value);
        });
    }
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.queueBuffer = [RXPCQueueBuffer defaultQueueBuffer];
        self.concurrentQueue = dispatch_queue_create("www.pc.com.abc", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
