//
//  RXASDK.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXASDK.h"
#import "RXComponetRoute.h"
#import "RXAHomeViewController.h"
@implementation RXASDK

+ (void)register {
    [RXComponetRoute registerWithRoute:@"asdk://AHomeVC" block:^id(NSDictionary *params) {
        RXAHomeViewController *vc = [[RXAHomeViewController alloc] initWithParams:params];
        return vc;
    }];
    
    [RXComponetRoute registerWithRoute:@"asdk://syncData" block:^id(NSDictionary *params) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
        dic[@"otherKey"] = @"asglksgjslkd";
        return dic;
    }];
    
    
    [RXComponetRoute registerWithRoute:@"asdk://asyncData" block:^id(NSDictionary *params) {
        
        void(^completion)(NSDictionary *) = params[kRXComponetRouteAsyncData];
        if (completion == nil) {
            return nil;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
            dic[@"otherKey"] = @"otherKey_async_data";
            [dic removeObjectForKey:kRXComponetRouteAsyncData];
            completion(dic);
        });
        return nil;
    }];
    
    
    
}
@end
