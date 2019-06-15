//
//  VKDownloadTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKDownloadTestManager.h"
#import "VKDownloadManager.h"
@implementation VKDownloadTestManager

- (void)test {
    NSString *str = @"https://opensource.apple.com/tarballs/CFNetwork/CFNetwork-128.2.tar.gz";
    str = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561187051&di=363bba28833999c6bb2f72ba4e99c9eb&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F337%2F45497.jpg";
    str = @"http://img3.imgtn.bdimg.com/it/u=288321735,873043392&fm=11&gp=0.jpg";
    [self test_tmp:str];
    
    str = @"http://img2.imgtn.bdimg.com/it/u=3747405845,2999323381&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img4.imgtn.bdimg.com/it/u=2793618333,3340501727&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img2.imgtn.bdimg.com/it/u=2285217619,3561768581&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img5.imgtn.bdimg.com/it/u=2724670739,3889200520&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img1.imgtn.bdimg.com/it/u=334090469,4083231762&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img4.imgtn.bdimg.com/it/u=3121638574,881623932&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img3.imgtn.bdimg.com/it/u=2788976074,2236162941&fm=26&gp=0.jpg";
    [self test_tmp:str];

    str = @"http://img5.imgtn.bdimg.com/it/u=4009594423,2961157628&fm=26&gp=0.jpg";
    [self test_tmp:str];
    
    str = @"";
    [self test_tmp:str];
    
    [[VKDownloadManager sharedInstance] downloadWithURL:nil completionBlock:^(NSURL * _Nullable localURL, NSError * _Nullable error, VKDownloadCacheType cacheType, NSURL * _Nullable downloadURL) {
        NSLog(@"1111: %@", [NSThread currentThread]);
    }];
}
- (void)test_tmp:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
    
    [[VKDownloadManager sharedInstance] downloadWithURL:url completionBlock:^(NSURL * _Nullable localURL, NSError * _Nullable error, VKDownloadCacheType cacheType, NSURL * _Nullable downloadURL) {
        NSLog(@"1111: %@", [NSThread currentThread]);
    }];
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
