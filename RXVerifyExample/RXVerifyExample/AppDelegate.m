//
//  AppDelegate.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "AppDelegate.h"
#import "XGPush.h"
#import "MainViewController.h"
//#import <RX3_TencentLiteSDK/TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuth.h>

#import "UncaughtExceptionHandler.h"
#import "RXServiceManager.h"
#import "RXTidyMainViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *mainNC;

@end

@implementation AppDelegate


- (void)config
{
//    [RXServiceManager addServiceName:@"RXCrashService" enable:YES async:YES];
//    [RXServiceManager addServiceName:@"RXJLRoutesService" enable:YES async:NO];
    
    
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"touches began in AppDelegate");
//}


- (void)showMain
{
    UIViewController *vc = nil;
    vc = [[MainViewController alloc] init];
//    vc = [RXTidyMainViewController new];
    self.mainNC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.mainNC;
}

- (void)xxxxxx {
    NSArray *buyAry = @[
                        @"20190408,11.04,1100",
//                        @"20190409,11.25,1700",
                        @"20190410,10.87,2500",
                        @"20190412,10.73,1200",
//                        @"20190418,10.19,2300",
//                        @"20190422,10.05,2400",
                        @"20190423,9.84,1800",
                        @"20190424,10.27,2400",
                        @"20190507,7.11,1400",
                        @"20190510,6.49,3200",
                        @"20190516,6.94,1500",
                        @"20190523,6.77,2600",
                        @"20190528,6.91,3800",
                        @"",
                        @"",
                        @"",
                        @""
                        ];
    NSArray *sellAry = @[
//                        @"20190415,11.03,2100", // 200
//                        @"20190419.10.51,2300",
//                        @"20190423,10.70,2200",
                        @"20190510,6.39,1700",
                        @"20190514,6.91,1500",
                        @"20190523,7.05,2500",
                        @"20190527,6.99,2600",
                        @"20190528,7.01,2600",
                        @"",
                        @"",
                        @"",
                        @"",
                        @""
                        ];
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSString *str = @"\"OneV\", \"TwoV\", \"ThreeV\"";
//    NSArray *ary = [str componentsSeparatedByString:@","];
//    NSLog(@"%@", ary);
    // third part 第三方初始化
    
//    NSString *str = @"a&bbbbbbbbbbbbbb&cc&dd&ddd&";
//    NSRange rang = [str rangeOfString:@"&"];
//    NSLog(@"range");
    
//    [self config];
//    [RXServiceManager application:application willFinishLaunchingWithOptions:launchOptions];
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [RXServiceManager application:application didFinishLaunchingWithOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self showMain];
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    [RXServiceManager executeSelector:_cmd paramArray:@[application]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    NSArray *paramArray = @[application,
//                            url ? url : [NSNull null],
//                            sourceApplication ? sourceApplication : [NSNull null],
//                            annotation ? annotation : [NSNull null]];
//    return [RXServiceManager boolReturnExecuteSelector:_cmd paramArray:paramArray];
//}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {

//    NSArray *paramArray = @[application,
//                            url ? url : [NSNull null]];
//    return [RXServiceManager boolReturnExecuteSelector:_cmd paramArray:paramArray];
//}
//- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    return [RXServiceManager application:application supportedInterfaceOrientationsForWindow:window];
//}

@end
