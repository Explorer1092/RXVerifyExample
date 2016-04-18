//
//  RVAFNetworkingViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/4/18.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVAFNetworkingViewController.h"
#import <AFNetworking.h>




static dispatch_queue_t responseAnalysisQueue(void) {
    static dispatch_queue_t sharedQueue = nil;
    static dispatch_once_t predicat;
    dispatch_once(&predicat, ^{
        sharedQueue = dispatch_queue_create("com.analysis.global.data", DISPATCH_QUEUE_CONCURRENT);
    });
    return sharedQueue;
}


@interface RVAFNetworkingViewController ()

@end

@implementation RVAFNetworkingViewController



- (void)test_Http_post_001
{
//    NSString *str = @"http://api.hiexhibition.com/v1/homepage";
    
    NSString *base = @"http://api.hiexhibition.com";
    NSString *info = @"v1/homepage";
    NSLog(@"start");
    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
//    httpSessionManager.completionQueue = responseAnalysisQueue();
    NSURLSessionDataTask *sessionDataTask = [httpSessionManager POST:info parameters:nil progress:^(NSProgress * progress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"success:responseObject:%@", [responseObject class]);
        dispatch_queue_t queue = responseAnalysisQueue();
        dispatch_async(queue, ^{
            NSLog(@"analysis data");
            sleep(2);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"go to main");
            });
        });
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"failed:%@", error);
    }];
    NSLog(@"end");
    NSLog(@"sessionDataTask:%@", sessionDataTask);
    [sessionDataTask cancel];
}



#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self test_Http_post_001];
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
