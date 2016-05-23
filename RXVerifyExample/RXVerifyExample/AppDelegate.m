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

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *mainNC;

@end

@implementation AppDelegate


- (void)config
{
//    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info) {
//        NSLog(@"viewDidLoad:%@", info.instance);
//    } error:NULL];
//    
//    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewWillAppear:%@", info.instance);
//    } error:NULL];
//    
//    
//    
//    
//    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewDidAppear:%@", info.instance);
//    } error:NULL];
//    
//    
//    
//    [UIViewController aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewWillDisappear:%@", info.instance);
//    } error:NULL];
//    
//    
//    
//    [UIViewController aspect_hookSelector:@selector(viewDidDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"viewDidDisappear:%@", info.instance);
//    } error:NULL];
    
    
    
    
}

- (void)showMain
{
    UIViewController *vc = nil;
    vc = [[MainViewController alloc] init];
    self.mainNC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.mainNC;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self config];
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

@end
