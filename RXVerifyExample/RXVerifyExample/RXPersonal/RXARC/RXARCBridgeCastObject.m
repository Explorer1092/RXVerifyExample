//
//  RXARCBridgeCastObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCBridgeCastObject.h"
#import "RXMRCUtil.h"
@implementation RXARCBridgeCastObject
- (void)test
{
    
//    [self _test_over_release];
    
//    [self _test_bridge_T_from_NonRetainablePointerType_to_RetainablePointerType];
    
//    [self _test_bridge_T_from_RetainablePointerType_to_NonRetainablePointerType];
    
//    [self _test_bridge_retained_from_RetainablePointerType_to_NonRetainablePointerType];
    
    [self _test_bridge_transfer_from_NonRetainablePointerType_to_RetainablePointerType];
    
}


- (void)_test_over_release
{
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    CFRelease(stringRef);
    // 这种字符串不可以过渡释放,否则会崩溃
    CFRelease(stringRef);
    
    CFStringRef stringRef2 = CFStringCreateWithCString(CFAllocatorGetDefault(), "123", kCFStringEncodingUTF8);
    CFRelease(stringRef2);
    // 这种字符串可以过渡释放,不会崩溃
    CFRelease(stringRef2);
}

- (void)_test_bridge_T_from_NonRetainablePointerType_to_RetainablePointerType
{
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    NSString *string = (__bridge NSString *)stringRef;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    CFRelease(stringRef);
    NSLog(@"after string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
    
    // 在这里不会崩溃,相当于过渡释放了
    CFRelease(stringRef);
} // 在这里会崩溃,因为ARC最后会添加  [string release]

- (void)_test_bridge_T_from_RetainablePointerType_to_NonRetainablePointerType
{
    NSString *string = [[NSString alloc] initWithFormat:@"123-%zd-abc", 456];
    CFStringRef stringRef = (__bridge CFStringRef)string;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    // 这里不会崩溃
    CFRelease(stringRef);
//    NSLog(@"after string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 这里会崩溃, arc 加了 [string release]

- (void)_test_bridge_retained_from_RetainablePointerType_to_NonRetainablePointerType
{
    NSString *string = [[NSString alloc] initWithFormat:@"123-%zd-abc", 456];
    CFStringRef stringRef = (__bridge_retained CFStringRef)string;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    // 这里不会崩溃
    CFRelease(stringRef);
} // 这里也不会崩溃

- (void)_test_bridge_transfer_from_NonRetainablePointerType_to_RetainablePointerType
{
    CFStringRef stringRef = CFStringCreateWithCString(CFAllocatorGetDefault(), "123-%d-abc", kCFStringEncodingUTF8);
    NSString *string = (__bridge_transfer NSString *)stringRef;
    NSLog(@"before string release:%@, count1:%zd", string, [RXMRCUtil objectRetainCount:string]);
    CFRelease(stringRef);
    // 这里崩溃了,string已经被提前释放了
    NSLog(@"after string release:%@, count2:%zd", string, [RXMRCUtil objectRetainCount:string]);
} // 这里崩溃了,因为加了[string release]

@end
