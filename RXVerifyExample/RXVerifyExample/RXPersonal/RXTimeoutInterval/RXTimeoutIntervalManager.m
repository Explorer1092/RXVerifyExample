//
//  RXTimeoutIntervalManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/29.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTimeoutIntervalManager.h"
@interface RXTimeoutIntervalManager()
@property (nonatomic, strong) NSMutableArray *managerArray;
@end


@implementation RXTimeoutIntervalManager
- (void)test {
    
    
//    [self _test_two];
    
    [self _test_three];
    
}

- (void)_test_zeor {
    
    [self _test_timeoutRequest:0 timeoutResource:0 timeout:0];
}
- (void)_test_one {
    
    [self _test_timeoutRequest:3 timeoutResource:0 timeout:0];
    [self _test_timeoutRequest:0 timeoutResource:3 timeout:0];
    [self _test_timeoutRequest:0 timeoutResource:0 timeout:3];
    
}
- (void)_test_two {
    [self _test_timeoutRequest:0 timeoutResource:6 timeout:6];
    
    [self _test_timeoutRequest:3 timeoutResource:6 timeout:0];
    [self _test_timeoutRequest:6 timeoutResource:3 timeout:0];
    [self _test_timeoutRequest:0 timeoutResource:3 timeout:6];
    [self _test_timeoutRequest:0 timeoutResource:6 timeout:3];
    [self _test_timeoutRequest:3 timeoutResource:0 timeout:6];
    [self _test_timeoutRequest:6 timeoutResource:0 timeout:3];
}

- (void)_test_three {
    
    [self _test_timeoutRequest:3 timeoutResource:6 timeout:9];
    [self _test_timeoutRequest:3 timeoutResource:9 timeout:6];
    [self _test_timeoutRequest:6 timeoutResource:3 timeout:9];
    [self _test_timeoutRequest:6 timeoutResource:9 timeout:3];
    [self _test_timeoutRequest:9 timeoutResource:3 timeout:6];
    [self _test_timeoutRequest:9 timeoutResource:6 timeout:3];
}

- (void)printWithStartTime:(CFAbsoluteTime)startTime mutDic:(NSMutableDictionary *)mutDic {
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime time = endTime - startTime;
    mutDic[@"cost"] = @(time);
    NSLog(@"mutDic:%@", mutDic);
}

- (void)_test_timeoutRequest:(NSTimeInterval)timeoutRequest timeoutResource:(NSTimeInterval)timeoutResource timeout:(NSTimeInterval)timeout {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    if (timeoutRequest > 0) {
        config.timeoutIntervalForRequest = timeoutRequest;
    }
    if (timeoutResource > 0) {
        config.timeoutIntervalForResource = timeoutResource;
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (timeout > 0) {
        manager.requestSerializer.timeoutInterval = timeout;
    }
    [self addManager:manager];
    NSMutableDictionary *mutDic = [NSMutableDictionary new];
    mutDic[@"timeoutRequest"] = @(timeoutRequest);
    mutDic[@"timeoutResource"] = @(timeoutResource);
    mutDic[@"timeout"] = @(timeout);
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    __weak typeof(self) weakSelf = self;
    [manager GET:@"http://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakSelf removeManager:manager];
        [weakSelf printWithStartTime:startTime mutDic:mutDic];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [weakSelf removeManager:manager];
         [weakSelf printWithStartTime:startTime mutDic:mutDic];
         NSLog(@"error:%@", error);
     }];
    
//    NSURLRequest *r;
//    r.timeoutInterval;
}

- (void)addManager:(id)manager {
    @synchronized (self.managerArray) {
        [self.managerArray addObject:manager];
    }
}
- (void)removeManager:(id)manager {
    @synchronized (self.managerArray) {
        [self.managerArray removeObject:manager];
    }
}

- (id)init {
    if (self = [super init]) {
        self.managerArray = [NSMutableArray new];
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
