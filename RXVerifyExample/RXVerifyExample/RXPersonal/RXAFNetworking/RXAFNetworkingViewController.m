//
//  RXAFNetworkingViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNetworkingViewController.h"
#import "RXAFNTest1Object.h"
#import "RXAFNTest2Object.h"
#import "RXAFNTest3Object.h"

@interface RXAFNetworkingViewController ()

@end

@implementation RXAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[RXAFNTest1Object new] test];
//    [[RXAFNTest2Object new] test];
    
//    [self test_mainQueue_dispathAsync_MainQueue];
    
//    [self test_mainQueue_dispathAsync_GlobalQueue];
    
    [self test_classProperty];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test_mainQueue_dispathAsync_MainQueue {
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
- (void)test_mainQueue_dispathAsync_GlobalQueue {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
- (void)test_classProperty {
    [RXAFNTest3Object setValue:4];
    NSLog(@"%zd", [RXAFNTest3Object value]);
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
