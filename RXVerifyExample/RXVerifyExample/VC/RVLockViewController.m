//
//  RVLockViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/27.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVLockViewController.h"
#import <libkern/OSAtomic.h>
#import <pthread.h>


typedef NS_ENUM(NSUInteger, LockType) {
    LockTypeOSSpinLock = 0,
    LockTypedispatch_semaphore,
    LockTypepthread_mutex,
    
    LockTypeNSCondition,
    LockTypeNSLock,
    LockTypepthread_mutex_recursive,
    
    LockTypeNSRecursiveLock,
    LockTypeNSConditionLock,
    LockTypesynchronized,
    LockTypeCount,
};

@interface RVLockViewController ()

@end

@implementation RVLockViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self performSelector:@selector(testLock) withObject:nil afterDelay:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testLock
{
    for (NSInteger i = 0; i < LockTypeCount; i++) {
        [self testWithType:i];
    }
    
    
    
}


- (void)testWithType:(LockType)type
{
    
    
    NSArray *stringArray = @[@"OSSpinLock", @"dispatch_semaphore", @"pthread_mutex",
                             @"NSCondition", @"NSLock", @"pthread_mutex_recursive",
                             @"NSRecursiveLock", @"NSConditionLock", @"synchronized"];
    
    
    static NSInteger count = 10000;
    
    NSString *title = @"";
    NSTimeInterval begin = 0;
    NSTimeInterval end = 0;
    switch (type) {
        case LockTypeOSSpinLock:
        {
            OSSpinLock lock = OS_SPINLOCK_INIT;
            begin = CACurrentMediaTime();
            for (NSInteger i = 0; i < count; i++) {
                OSSpinLockLock(&lock);
                OSSpinLockUnlock(&lock);
            }
            end = CACurrentMediaTime();
            title = @"OSSpinLock                                ";
            
        }
            break;
        case LockTypedispatch_semaphore:
        {
            dispatch_semaphore_t lock = dispatch_semaphore_create(1);
            begin = CACurrentMediaTime();
            for (NSInteger i = 0; i < count; i++) {
                dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
                dispatch_semaphore_signal(lock);
            }
            end = CACurrentMediaTime();
            title = @"dispatch_semaphore                        ";
        }
            break;
        case LockTypepthread_mutex:
        {
            pthread_mutex_t lock;
            pthread_mutex_init(&lock, NULL);
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                pthread_mutex_lock(&lock);
                pthread_mutex_unlock(&lock);
            }
            end = CACurrentMediaTime();
            pthread_mutex_destroy(&lock);
            title = @"pthread_mutex                             ";
        }
            break;
        case LockTypeNSCondition:
        {
            NSCondition *lock = [NSCondition new];
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                [lock lock];
                [lock unlock];
            }
            end = CACurrentMediaTime();
            title = @"NSCondition                               ";
        }
            break;
        case LockTypeNSLock:
        {
            NSLock *lock = [NSLock new];
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                [lock lock];
                [lock unlock];
            }
            end = CACurrentMediaTime();
            title = @"NSLock                                    ";
        }
            break;
        case LockTypepthread_mutex_recursive:
        {
            pthread_mutex_t lock;
            pthread_mutexattr_t attr;
            pthread_mutexattr_init(&attr);
            pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
            pthread_mutex_init(&lock, &attr);
            pthread_mutexattr_destroy(&attr);
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                pthread_mutex_lock(&lock);
                pthread_mutex_unlock(&lock);
            }
            end = CACurrentMediaTime();
            title = @"pthread_mutex_recursive                   ";
        }
            break;
        case LockTypeNSRecursiveLock:
        {
            NSRecursiveLock *lock = [NSRecursiveLock new];
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                [lock lock];
                [lock unlock];
            }
            end = CACurrentMediaTime();
            title = @"NSRecursiveLock                           ";
        }
            break;
        case LockTypeNSConditionLock:
        {
            NSConditionLock *lock = [[NSConditionLock alloc] initWithCondition:1];
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                [lock lock];
                [lock unlock];
            }
            end = CACurrentMediaTime();
            title = @"NSConditionLock                           ";
        }
            break;
        case LockTypesynchronized:
        {
            NSObject *lock = [NSObject new];
            begin = CACurrentMediaTime();
            for (int i = 0; i < count; i++) {
                @synchronized(lock) {}
            }
            end = CACurrentMediaTime();
            title = @"synchronized                              ";
        }
        default:
            break;
    }
    
    NSLog(@"%@%.8f ms", title, (end - begin) * 1000);

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
