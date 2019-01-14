//
//  RXBlockReferenceValueObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockReferenceValueObject.h"


#import "RXBlockTmpObject.h"

static void _s_test_name(NSString *prefix, RXBlockTmpObject *tmpObject)
{
    NSLog(@"%@, %@", prefix, tmpObject);
}

@interface RXBlockReferenceValueObject()

@property (nonatomic, strong) RXBlockTmpObject *tmpObject;
@property (nonatomic, strong) NSMutableArray *mutableArray;

@end
@implementation RXBlockReferenceValueObject
- (void)test
{
//    [self _test_normal];
    [self _test_normal_mut];
}

- (void)_test_normal
{
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"1"];
    NSLog(@"1 address in object:%@", self.tmpObject);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"2"];
    NSLog(@"2 address in object:%@", self.tmpObject);
    
    // 代码1: 2秒后执行一个任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
        _s_test_name(@"instance variable", _tmpObject);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"3"];
    NSLog(@"3 address in object:%@", self.tmpObject);
    
    id value = _tmpObject;
    NSLog(@"value address in object:%@", value);
    
    // 代码2: 3秒后执行一个任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3), queue, ^{
        _s_test_name(@"local variable", value);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    NSLog(@"4 address in object:%@", self.tmpObject);
}

- (void)_test_normal_mut
{
    self.mutableArray = [NSMutableArray new];
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"1"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"1 address in object:%@", self.tmpObject);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"2"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"2 address in object:%@", self.tmpObject);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
        _s_test_name(@"instance variable", _tmpObject);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"3"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"3 address in object:%@", self.tmpObject);
    
    id value = _tmpObject;
    NSLog(@"value address in object:%@", value);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3), queue, ^{
        _s_test_name(@"local variable", value);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"4 address in object:%@", self.tmpObject);
}

- (void)dealloc
{
    NSLog(@"RXBlockReferenceValueObject dealloc");
}


@end
