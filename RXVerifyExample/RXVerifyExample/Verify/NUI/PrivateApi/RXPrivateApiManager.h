//
//  RXPrivateApiManager.h
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/11/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXPrivateApiManager : NSObject
+ (instancetype)sharedInstance;
- (void)test;
@end

NS_ASSUME_NONNULL_END
