//
//  RXMRCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCObject.h"
#import "RXARCTmpObject.h"
#import "RXMRCUtil.h"
@interface RXMRCObject()
@property (nonatomic, retain) RXARCTmpObject *tmpObject;
@end

@implementation RXMRCObject
- (void)_print_tmpObject_info:(NSString *)prefix
{
    NSUInteger count = [RXMRCUtil objectRetainCount:self.tmpObject];
    NSLog(@"count in %@:%zd", prefix, count);
}
- (void)_add_runloop_observer
{
    //1.创建监听者
    /*
     第一个参数:怎么分配存储空间
     第二个参数:要监听的状态 kCFRunLoopAllActivities 所有的状态
     第三个参数:时候持续监听
     第四个参数:优先级 总是传0
     第五个参数:当状态改变时候的回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        /*
         kCFRunLoopEntry = (1UL << 0),        即将进入runloop
         kCFRunLoopBeforeTimers = (1UL << 1), 即将处理timer事件
         kCFRunLoopBeforeSources = (1UL << 2),即将处理source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),即将进入睡眠
         kCFRunLoopAfterWaiting = (1UL << 6), 被唤醒
         kCFRunLoopExit = (1UL << 7),         runloop退出
         kCFRunLoopAllActivities = 0x0FFFFFFFU
         */
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                [self _print_tmpObject_info:@"kCFRunLoopEntry"];
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeTimers"];
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeSources"];
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入睡眠");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeWaiting"];
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                [self _print_tmpObject_info:@"kCFRunLoopAfterWaiting"];
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                [self _print_tmpObject_info:@"kCFRunLoopExit"];
                break;
                
            default:
                break;
        }
    });
    
    /*
     第一个参数:要监听哪个runloop
     第二个参数:观察者
     第三个参数:运行模式
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, kCFRunLoopDefaultMode);
    
    //NSDefaultRunLoopMode == kCFRunLoopDefaultMode
    //NSRunLoopCommonModes == kCFRunLoopCommonModes
}

- (void)_foo:(id)x
{
    NSUInteger count = [x retainCount];
    NSLog(@"count in foo method:%zd", count);
}
- (void)test_ns_consumed
{
    NSObject *object = [[NSObject alloc] init];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    
    [self _foo:object];
    
    count = [object retainCount];
    NSLog(@"count before release:%zd", count);
    [object release];
}

- (id)_foo_return_value
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    return [object autorelease];
}
- (void)test_ns_retain_count
{
    [self _add_runloop_observer];
    
    id object = [self _foo_return_value];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after foo:%zd", count);
    
    self.tmpObject = object;
    count = [object retainCount];
    NSLog(@"count after self.tmp:%zd", count);
//    // 这里self会出现循环引用,会出现self内存泄漏
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSUInteger count2 = [self.tmpObject retainCount];
//        NSLog(@"count in dispatch:%zd", count2);
//    });
}


@end
