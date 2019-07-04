//
//  RXPCQueueBufferManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCQueueBufferManager.h"
#import "RXPCQueueBuffer.h"
#import "RXPCDefectQueueBuffer.h"
@interface RXPCQueueBufferManager ()

@property (nonatomic, strong) RXPCQueueBuffer *queueBuffer;
@property (nonatomic, strong) RXPCDefectQueueBuffer *defectQueueBuffer;

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;


@end

@implementation RXPCQueueBufferManager

- (void)test {
    
    [self test_defect_producer_full];
    
//    [self test_defect_consume_empty];
}



#pragma mark - Defect Queue Buffer
// 三分之一消耗,三分之二生产,会产生大量的full
- (void)test_defect_producer_full {
    // 先填满
    for (NSInteger i = 0; i < self.defectQueueBuffer.maxLength; i++) {
        [self defect_producer:i];
    }
    NSInteger start = self.defectQueueBuffer.maxLength - 1;
    for (NSInteger i = 0; i < 40; i++) {
        int arc = arc4random() % 3;
        if (arc == 0) {
            [self defect_consumer];
        } else {
            start += 1;
            [self defect_producer:start];
        }
    }
}

// 三分之一生成,三分之二消耗,会产生大量的empty
- (void)test_defect_consume_empty {
    NSInteger start = -1;
    for (NSInteger i = 0; i < 40; i++) {
        int arc = arc4random() % 3;
        if (arc == 0) {
            start += 1;
            [self defect_producer:start];
        } else {
            [self defect_consumer];
        }
    }
}


- (void)defect_producer:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.concurrentQueue, ^{
        [weakSelf.defectQueueBuffer push:@(index)];
    });
}
- (void)defect_consumer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.concurrentQueue, ^{
        [weakSelf.defectQueueBuffer pop];
    });
}

#pragma mark - Prefect Queue Buffer

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.queueBuffer = [RXPCQueueBuffer defaultQueueBuffer];
        self.defectQueueBuffer = [RXPCDefectQueueBuffer defaultQueueBuffer];
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
