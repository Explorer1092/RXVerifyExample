//
//  VKDownloadManager.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "VKDownloadDefine.h"
NS_ASSUME_NONNULL_BEGIN


@interface VKDownloadManager : NSObject

- (NSOperation *)downloadWithURL:(nullable NSURL *)url completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;


- (void)cancelAll;


+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
