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
    NSString *info = @"v1/zhanhui";
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
//    [sessionDataTask cancel];
}

- (NSString *)parametersFromDictionary:(NSDictionary *)dic
{
    NSMutableArray *ary = [NSMutableArray array];
    for (NSString *key in dic.allKeys) {
        NSString *value = [dic objectForKey:key];
        [ary addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
//    NSString *extraString = [NSString stringWithFormat:@"clientVersion=iOS%@", [RXInfoHelper appVersion]];
//    [ary addObject:extraString];
//    
//    extraString = [NSString stringWithFormat:@"clienttype=1"];
//    [ary addObject:extraString];
    NSString *result = [ary componentsJoinedByString:@"&"];
    return result;
}


- (void)test_Http_post_002
{
    //    NSString *str = @"http://api.hiexhibition.com/v1/homepage";
    
    NSString *base = @"http://api.hiexhibition.com";
    NSString *info = @"v1/zhanhui";
    NSDictionary *params = @{@"num":@"1",
                             @"offset":@"1"};
    NSLog(@"start");
    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    [requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
        return [self parametersFromDictionary:parameters];
    }];
    httpSessionManager.requestSerializer = requestSerializer;
    NSURLSessionDataTask *sessionDataTask = [httpSessionManager POST:info parameters:params progress:^(NSProgress * progress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"success:responseObject class:%@", [responseObject class]);
        NSLog(@"success:responseObject:%@", responseObject);
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
}

/*

AFHTTPRequestOperationManager *manager1 = [AFHTTPRequestOperationManager manager];
[manager1 POST:@"http://openapi.service.cdn.vip.xunlei.com/high_speed_channel/query_flux"
    parameters:nil
      bodyData:jsonData
       success:^(AFHTTPRequestOperation *operation, id responseObject) {


AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

NSString *fullUrl = [NSString stringWithFormat:@"%@%@", valueAddedServiceStaticDataURLString, language];
[manager GET:[NSString stringWithFormat:fullUrl, XIAOQIANG_SERVER]
  parameters:nil
     success:^(NSURLSessionDataTask *task, id responseObject){
         XMLogInfo(@"XMRValueAddedServiceManager getValueAddedStaticDataWithLanguage: result:%@", responseObject);
         NSDictionary *vasDict = responseObject;
         if (XM_IS_DICT_NIL(vasDict))
         {
             NSError *error = [NSError errorWithDomain:@"XMRValueAddedServiceError" code:-1 userInfo:nil];
             fail(error);
             return;
         }
         
         if (nil != vasDict)
         {
             NSMutableArray *resultAry = [NSMutableArray array];
             for (NSString *key in vasDict)
             {
                 NSDictionary *dict = vasDict[key];
                 if (!XM_IS_DICT_NIL(dict))
                 {
                     XMRValueAddedService *vas = [[XMRValueAddedService alloc] initWithDictionary:dict key:key];
                     [resultAry addObject:vas];
                 }
             }
             
             NSArray * sortAry = [resultAry sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                 XMRValueAddedService *vas1 = (XMRValueAddedService *)obj1;
                 XMRValueAddedService *vas2 = (XMRValueAddedService *)obj2;
                 
                 if (vas1.weight < vas2.weight) {
                     return NSOrderedDescending;
                 }else if (vas1.weight == vas2.weight) {
                     return NSOrderedSame;
                 }else {
                     return NSOrderedAscending;
                 }
             }];
             success(sortAry);
         }
         else
         {
             NSError *error = [NSError errorWithDomain:@"XMRValueAddedServiceError" code:-1 userInfo:nil];
             fail(error);
         }
     }
     failure:^(NSURLSessionDataTask *task, NSError *error){
         fail(error);
     }];
 
 
 */

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self test_Http_post_002];
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
