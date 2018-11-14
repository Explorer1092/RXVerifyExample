//
//  RXAFNetworkReachabilityManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNetworkReachabilityManager.h"
#if !TARGET_OS_WATCH
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>


NSString * const RXAFNetworkingReachabilityDidChangeNotification = @"com.alamofire.networking.reachability.change.rx";
NSString * const RXAFNetworkingReachabilityNotificationStatusItem = @"RXAFNetworkingReachabilityNotificationStatusItem";

typedef void (^RXAFNetworkReachabilityStatusBlock)(RXAFNetworkReachabilityStatus status);

NSString * RXAFStringFromNetworkReachabilityStatus(RXAFNetworkReachabilityStatus status) {
    switch (status) {
        case RXAFNetworkReachabilityStatusNotReachable:
            // TODOAFN_M_2_K_2
            // https://blog.csdn.net/playddt/article/details/46332547
            return NSLocalizedStringFromTable(@"Not Reachable", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusReachableViaWWAN:
            return NSLocalizedStringFromTable(@"Reachable via WWAN", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusReachableViaWiFi:
            return NSLocalizedStringFromTable(@"Reachable via WiFi", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusUnknown:
        default:
            return NSLocalizedStringFromTable(@"Unknown", @"RXAFNetworking", nil);
    }
}


// TODOAFN_M_2_K_3  与TODOAFN_M_2_K_0相关
// 各种状态名字解释与相互之间的关联
static RXAFNetworkReachabilityStatus RXAFNetworkReachabilityStatusForFlags(SCNetworkReachabilityFlags flags) {
    BOOL isReachable = ((flags & kSCNetworkReachabilityFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkReachabilityFlagsConnectionRequired) != 0);
    BOOL canConnectionAutomatically = (((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) || ((flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0));
    BOOL canConnectWithoutUserInteraction = (canConnectionAutomatically && (flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0);
    BOOL isNetworkReachable = (isReachable && (!needsConnection || canConnectWithoutUserInteraction));
    
    RXAFNetworkReachabilityStatus status = RXAFNetworkReachabilityStatusUnknown;
    if (isNetworkReachable == NO) {
        status = RXAFNetworkReachabilityStatusNotReachable;
    }
#if    TARGET_OS_IPHONE
    else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
        status = RXAFNetworkReachabilityStatusReachableViaWWAN;
    }
#endif
    else {
        status = RXAFNetworkReachabilityStatusReachableViaWiFi;
    }
    
    return status;
}


/**
 * Queue a status change notification for the main thread.
 *
 * This is done to ensure that the notifications are received in the same order
 * as they are sent. If notifications are sent directly, it is possible that
 * a queued notification (for an earlier status condition) is processed after
 * the later update, resulting in the listener being left in the wrong state.
 */
// TODOAFN_M_2_K_4    main_queue  dispath_async  main_queue, 异步不一定会创建新的线程
static void RXAFPostReachabilityStatusChange(SCNetworkReachabilityFlags flags, RXAFNetworkReachabilityStatusBlock block) {
    RXAFNetworkReachabilityStatus status = RXAFNetworkReachabilityStatusForFlags(flags);
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) {
            block(status);
        }
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSDictionary *userInfo = @{ RXAFNetworkingReachabilityNotificationStatusItem: @(status) };
        [notificationCenter postNotificationName:RXAFNetworkingReachabilityDidChangeNotification object:nil userInfo:userInfo];
    });
}

static void RXAFNetworkReachabilityCallback(SCNetworkReachabilityRef __unused target, SCNetworkReachabilityFlags flags, void *info) {
    RXAFPostReachabilityStatusChange(flags, (__bridge RXAFNetworkReachabilityStatusBlock)info);
}


static const void * RXAFNetworkReachabilityRetainCallback(const void *info) {
    return Block_copy(info);
}

static void RXAFNetworkReachabilityReleaseCallback(const void *info) {
    if (info) {
        Block_release(info);
    }
}


@interface RXAFNetworkReachabilityManager()

@property (readonly, nonatomic, assign) SCNetworkReachabilityRef networkReachability;
@property (readwrite, nonatomic, assign) RXAFNetworkReachabilityStatus networkReachabilityStatus;
@property (readwrite, nonatomic, copy) RXAFNetworkReachabilityStatusBlock networkReachabilityStatusBlock;
@end



@implementation RXAFNetworkReachabilityManager

@end

#endif
