//
//  RXPCQueueBuffer.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCQueueBuffer.h"

@interface RXPCQueueBuffer()

@property (nonatomic, strong) NSMutableArray *bufferArray;
@property (nonatomic, assign) NSInteger realLength;
@property (nonatomic, assign) NSInteger maxLength; // maxLength = realLength + 1;
@property (nonatomic, assign) NSInteger nextIn;
@property (nonatomic, assign) NSInteger nextOut;

@property (nonatomic, strong) NSLock *lock;
@end

@implementation RXPCQueueBuffer

#pragma mark - Constructor And Destructor
+ (id)defaultQueueBuffer {
    RXPCQueueBuffer *result = [[RXPCQueueBuffer alloc] initWithMaxLength:10];
    return result;
}
- (id)initWithMaxLength:(NSInteger)maxLength {
    if (self = [super init]) {
        NSInteger realLength = maxLength + 1;
        NSMutableArray *ary = [NSMutableArray new];
        for (NSInteger i = 0; i < realLength; i++) {
            [ary addObject:[NSNull new]];
        }
        self.bufferArray = ary;
        self.realLength = realLength;
        self.maxLength = maxLength;
        self.nextIn = 0;
        self.nextOut = 0;
        self.lock = [NSLock new];
    }
    return self;
}


- (BOOL)empty {
    return self.nextIn == self.nextOut;
}

- (BOOL)full {
    return [self increase:self.nextIn] == self.nextOut;
}

- (void)push:(id)data {
    [self.lock lock];
    if (self.full) {
        [self.lock unlock];
        NSLog(@"full");
        return;
    }
    NSLog(@"push:%@", data);
    [self.bufferArray replaceObjectAtIndex:self.nextIn withObject:data];
    self.nextIn = [self increase:self.nextIn];
    
    [self.lock unlock];
}

- (NSInteger)increase:(NSInteger)next {
    return (next + 1) % self.realLength;
}
- (id)pop {
    [self.lock lock];
    if (self.empty) {
        NSLog(@"empty");
        [self.lock unlock];
        return nil;
    }
    id value = self.bufferArray[self.nextOut];
    self.bufferArray[self.nextOut] = [NSNull new];
    self.nextOut = [self increase:self.nextOut];
    [self.lock unlock];
    return value;
}

@end
