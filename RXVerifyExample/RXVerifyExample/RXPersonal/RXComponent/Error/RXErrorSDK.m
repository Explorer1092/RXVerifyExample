//
//  RXErrorSDK.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXErrorSDK.h"
#import "RXComponetRoute.h"
#import "RXErrorViewController.h"
@implementation RXErrorSDK
+ (void)register {
    [RXComponetRoute registerWithRoute:kRXComponetRouteErrorRoute block:^id(NSDictionary *params) {
        RXErrorViewController *vc = [[RXErrorViewController alloc] initWithParams:params];
        return vc;
    }];
}
@end
