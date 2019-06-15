//
//  VKDownloadCacheManager.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "VKDownloadDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface VKDownloadCacheManager : NSObject
- (BOOL)findWithURL:(NSURL *)url completionBlock:(VKDownloadCompletionBlock)completionBlock;
- (void)saveWithURL:(NSURL *)url fromURL:(NSURL *) fromURL completionBlock:(VKDownloadCompletionBlock)completionBlock;
- (NSString *)tmpFullPathWithURL:(NSURL *)url;
- (void)clearAll;


+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
