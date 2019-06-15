//
//  VKDownloadOperation.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import "VKDownloadOperation.h"
#import "VKDownloadCacheManager.h"
#import "AFURLSessionManager.h"
@interface VKDownloadOperation()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *task;
@property (nonatomic, strong) NSProgress *progress;


@property (nonatomic, strong) NSURLSession *session2;
@property (nonatomic, strong) NSURLSessionDownloadTask *task2;



@property (nonatomic, strong) NSURL *url;
@end

@implementation VKDownloadOperation

@synthesize executing = _executing;
@synthesize finished = _finished;


- (id)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        self.url = url;
        self.progress = [[NSProgress alloc] initWithParent:nil userInfo:nil];
        self.progress.totalUnitCount = NSURLSessionTransferSizeUnknown;
    }
    return self;
}

- (void)start {
    if (self.isCancelled) {
        self.finished = YES;
        self.executing = NO;
        return;
    }
    self.executing = YES;
    

//    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
//    self.task = [self.session downloadTaskWithURL:self.url];
//    [self.task resume];
    
    
    
    NSURLSessionConfiguration *configuration  =  [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    __weak typeof(self) weakSelf = self;
    self.task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (weakSelf.vk_progressBlock) {
            weakSelf.vk_progressBlock(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSString *fullpath = [[VKDownloadCacheManager sharedInstance] tmpFullPathWithURL:weakSelf.url];
        return [NSURL fileURLWithPath:fullpath];

    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        weakSelf.finished = YES;
        weakSelf.executing = NO;
        [weakSelf _pvk_completionWithLocalURL:filePath error:error redirectURL:nil];
    }];
    [self.task resume];
}

//#pragma mark - NSURLSessionTaskDelegate
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    self.executing = NO;
//    self.finished = YES;
//    if (error != nil) {
//        NSLog(@"vk_log_download:下载失败");
//        NSError *realError = PVK_errorWithCodeAndMsg(VKDownloadErrorType_URLIsWrong, [error description]);
//        [self _pvk_completionWithLocalURL:nil error:realError redirectURL:nil];
//    }
//}
//
//#pragma mark - NSURLSessionDownloadDelegate
//// 下载完成
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
//    self.executing = NO;
//    self.finished = YES;
//
//    NSLog(@"vk_log_download:下载完成 %@", location);
//    [self _pvk_completionWithLocalURL:location error:nil redirectURL:nil];
//}
//// 断点下载数据
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
//}
//// 写数据
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
//    self.progress.completedUnitCount = totalBytesWritten;
//    self.progress.totalUnitCount = totalBytesExpectedToWrite;
//
//    NSLog(@"vk_log_download:下载进度, totalBytesWritten:%lld, totalBytesExpectedToWrite:%lld", totalBytesWritten, totalBytesExpectedToWrite);
//    __weak __typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if (weakSelf.vk_progressBlock) {
//            weakSelf.vk_progressBlock(weakSelf.progress);
//        }
//    });
//}

#pragma mark - Private
- (void)_pvk_completionWithLocalURL:(NSURL *)localURL error:(NSError *)error redirectURL:(NSURL *)redirectURL {
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (weakSelf.vk_completionBlock) {
            weakSelf.vk_completionBlock(localURL, error, redirectURL);
        }
    });
}

#pragma mark - Concurrent
- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
- (BOOL)isConcurrent {
    return YES;
}
@end
