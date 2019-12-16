//
//  RXJLRouterViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXJLRouterViewController.h"
#import "JLRoutes.h"
#import "RXLayoutViewController.h"
@interface RXJLRouterViewController ()

@end

@implementation RXJLRouterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    
}

- (void)_test_global_scheme
{
    [[JLRoutes globalRoutes] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary *parameters) {
        NSString *object = parameters[@"object"];
        NSString *action = parameters[@"action"];
        NSLog(@"object:%@ action:%@", object, action);
        // stuff
        return YES;
    }];
    
    NSURL *editPost = [NSURL URLWithString:@"xes://post/halfrost?debug=true&foo=bar"];
    [JLRoutes routeURL:editPost];

}
- (void)_test_custom_scheme
{
    [[JLRoutes routesForScheme:@"xes"] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary *parameters) {
        NSString *object = parameters[@"object"];
        NSString *action = parameters[@"action"];
        
        NSLog(@"object:%@ action:%@", object, action);
        [self.navigationController pushViewController:[[RXLayoutViewController alloc] init] animated:YES];
        // stuff
        return YES;
    }];
    NSURL *editPost = [NSURL URLWithString:@"xes://post/halfrost?debug=true&foo=bar"];
    BOOL ok = [JLRoutes routeURL:editPost];

    NSLog(@"ok:%zd", (long)ok);
}
- (void)_test_async
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[JLRoutes routesForScheme:@"xes"] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary *parameters) {
            NSString *object = parameters[@"object"];
            NSString *action = parameters[@"action"];
            

            NSLog(@"object:%@ action:%@", object, action);
            
            [weakSelf.navigationController pushViewController:[[RXLayoutViewController alloc] init] animated:YES];
            // stuff
            return YES;
        }];
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSURL *editPost = [NSURL URLWithString:@"xes://post/halfrost?debug=true&foo=bar"];
        //    [[UIApplication sharedApplication] openURL:editPost];
        [JLRoutes routeURL:editPost];
    });
}
- (void)_test_async_2
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[JLRoutes routesForScheme:@"xes"] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary *parameters) {
            NSString *object = parameters[@"object"];
            NSString *action = parameters[@"action"];

            NSLog(@"object:%@ action:%@", object, action);
            [weakSelf.navigationController pushViewController:[[RXLayoutViewController alloc] init] animated:YES];
            // stuff
            return YES;
        }];
    });
    
    NSURL *editPost = [NSURL URLWithString:@"xes://post/halfrost?debug=true&foo=bar"];
    BOOL ok = [JLRoutes routeURL:editPost];
    if (!ok) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [JLRoutes routeURL:editPost];
        });
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
