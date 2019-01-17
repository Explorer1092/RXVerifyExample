//
//  RXBlockChangeOverTimeMRCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockChangeOverTimeMRCObject.h"

#import "RXPrintUtil.h"
#include <malloc/malloc.h>


static NSInteger globalVariable = 1;

@interface RXBlockChangeOverTimeMRCObject()
@property (nonatomic, copy) NSInteger(^block)(NSInteger);

@property (nonatomic, assign) NSInteger instanceVariable;
@end




@implementation RXBlockChangeOverTimeMRCObject
- (void)test
{
    NSLog(@"--------RXBlockChangeOverTimeMRCObject--------");
    self.instanceVariable = 10;
    NSInteger localVariable = 100;
    __block NSInteger blockVariable = 1000;
    
    NSInteger (^block_noVariable)(NSInteger) = ^(NSInteger m) {
        return m;
    };
    [RXPrintUtil printBlockWithPrefix:@"block_noVariable" block:block_noVariable];
    self.block = block_noVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_noVariable" block:self.block];
    
    NSInteger (^block_globalVariable)(NSInteger) = ^(NSInteger m) {
        return m + globalVariable;
    };
    [RXPrintUtil printBlockWithPrefix:@"block_globalVariable" block:block_globalVariable];
    self.block = block_globalVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_globalVariable" block:self.block];
    
    // MRC解决循环引用
    __block __typeof(self) weakSelf = self;
    NSInteger (^block_instanceVariable)(NSInteger) = ^(NSInteger m) {
        if (malloc_zone_from_ptr(weakSelf)) {
            return m + weakSelf.instanceVariable;
        } else {
            return m;
        }
    };
    [RXPrintUtil printBlockWithPrefix:@"block_instanceVariable" block:block_instanceVariable];
    self.block = block_instanceVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_instanceVariable" block:self.block];
    
    
    NSInteger (^block_localVariable)(NSInteger) = ^(NSInteger m) {
        return m + localVariable;
    };
    [RXPrintUtil printBlockWithPrefix:@"block_localVariable" block:block_localVariable];
    self.block = block_localVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_localVariable" block:self.block];
    
    
    NSInteger (^block_blockVariable)(NSInteger) = ^(NSInteger m) {
        blockVariable++;
        return m + blockVariable;
    };
    [RXPrintUtil printBlockWithPrefix:@"block_blockVariable" block:block_blockVariable];
    self.block = block_blockVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_blockVariable" block:self.block];
}
- (void)dealloc
{
    [super dealloc];
    NSLog(@"RXBlockChangeOverTimeMRCObject dealloc");
}
@end
