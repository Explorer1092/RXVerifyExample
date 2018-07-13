//
//  RXRACClassViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/13.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRACClassViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RXRACClassViewController ()

@end

@implementation RXRACClassViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test_signal];
    
    [self test_signal_cancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://www.cnblogs.com/fengmin/p/5662270.html
#pragma mark - test


// RACSignal使用步骤：
// 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id subscriber))didSubscribe
// 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 3.发送信号 - (void)sendNext:(id)value
- (void)test_signal
{
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber> _Nonnull subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 3.发送信号
            NSLog(@"%@:发送信号", NSStringFromSelector(_cmd));
            [subscriber sendNext:@(1)];
        });
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"%@:信号发送完毕", NSStringFromSelector(_cmd));
        }];
    }];
    
    
    // 如果要取消就拿到RACDisposable
    // 2.订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@:x:%@", NSStringFromSelector(_cmd), x);
    }];
    
}

- (void)test_signal_cancel
{
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber> _Nonnull subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 3.发送信号
            NSLog(@"%@:发送信号", NSStringFromSelector(_cmd));
            [subscriber sendNext:@(1)];
        });
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"%@:信号发送完毕", NSStringFromSelector(_cmd));
        }];
    }];
    
    // 如果要取消就拿到RACDisposable
    // 2.订阅信号
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@:x:%@", NSStringFromSelector(_cmd), x);
    }];
    // 取消订阅
    [disposable dispose];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
