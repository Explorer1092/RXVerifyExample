//
//  VKDownloadManager.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import "VKDownloadManager.h"
#import "VKDownloadOperation.h"
#import "VKDownloadCacheManager.h"
@interface VKDownloadManager()

@property (nonatomic, strong) NSMutableDictionary *downloadOperationMutDic;

@property (nonatomic, strong) dispatch_semaphore_t operationSemaphore;
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
@end

@implementation VKDownloadManager
- (NSOperation *)downloadWithURL:(NSURL *)url completionBlock:(nullable VKDownloadCompletionBlock)completionBlock {
    NSString *key = [self _pvk_cacheKeyForURL:url];
    // url 为空
    if (key.length == 0) {
        [self _pvk_main_executBlock:completionBlock localURL:nil error:PVK_errorWithCode(VKDownloadErrorType_URLIsNull) cacheType:VKDownloadCacheType_None downloadURL:url];
        return nil;
    }
    
    BOOL inCache = [[VKDownloadCacheManager sharedInstance] findWithURL:url completionBlock:completionBlock];
    // 在缓存中找到资源
    if (inCache) {
        return nil;
    }
    
    VKDownloadOperation *operation = [self _pvk_operationWithKey:key];
    if (operation == nil || operation.isFinished || operation.isCancelled) {
        operation = [[VKDownloadOperation alloc] initWithURL:url];
        __weak typeof(self) weakSelf = self;
        operation.vk_completionBlock = ^(NSURL * _Nullable localURL, NSError * _Nullable error, NSURL * _Nullable redirectURL) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!strongSelf) {
                return;
            }
            [weakSelf _pvk_removeOperationWithKey:key];
            [[VKDownloadCacheManager sharedInstance] saveWithURL:url fromURL:localURL completionBlock:completionBlock];
            [weakSelf _pvk_main_executBlock:completionBlock localURL:nil error:error cacheType:VKDownloadCacheType_Network downloadURL:url];
        };
        [self _pvk_addOperation:operation key:key];
        [self.downloadQueue addOperation:operation];
    }
    return operation;
}

- (void)cancelAll {
    [self.downloadQueue cancelAllOperations];
}



#pragma mark - Private

- (void)_pvk_main_executBlock:(VKDownloadCompletionBlock)block localURL:(NSURL *)localURL error:(NSError *)error cacheType:(VKDownloadCacheType)cacheType downloadURL:(NSURL *)downloadURL {
    if (block == nil) {
        return;
    }
    if ([NSThread isMainThread]) {
        block(localURL, error, cacheType, downloadURL);
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(localURL, error, cacheType, downloadURL);
        });
    }
}
// 通过key获取下载任务
- (VKDownloadOperation *)_pvk_operationWithKey:(NSString *)key {
    VKDownloadOperation *result = nil;
    dispatch_semaphore_wait(self.operationSemaphore, DISPATCH_TIME_FOREVER);
    result = self.downloadOperationMutDic[key];
    dispatch_semaphore_signal(self.operationSemaphore);
    return result;
}
// 添加下载任务
- (void)_pvk_addOperation:(VKDownloadOperation *)operation key:(NSString *)key {
    if (operation == nil) {
        return;
    }
    dispatch_semaphore_wait(self.operationSemaphore, DISPATCH_TIME_FOREVER);
    self.downloadOperationMutDic[key] = operation;
    dispatch_semaphore_signal(self.operationSemaphore);
}
// 通过key移除下载任务
- (void)_pvk_removeOperationWithKey:(NSString *)key {
    dispatch_semaphore_wait(self.operationSemaphore, DISPATCH_TIME_FOREVER);
    [self.downloadOperationMutDic removeObjectForKey:key];
    dispatch_semaphore_signal(self.operationSemaphore);
}

- (NSString *)_pvk_cacheKeyForURL:(NSURL *)url {
    if (!url) {
        return @"";
    }
    
//    if (self.cacheKeyFilter) {
//        return self.cacheKeyFilter(url);
//    } else {
//        return url.absoluteString;
//    }
    return url.absoluteString;
}


#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.downloadOperationMutDic = [NSMutableDictionary new];
        self.operationSemaphore = dispatch_semaphore_create(1);
        self.downloadQueue = [NSOperationQueue new];
        self.downloadQueue.maxConcurrentOperationCount = 6;
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
