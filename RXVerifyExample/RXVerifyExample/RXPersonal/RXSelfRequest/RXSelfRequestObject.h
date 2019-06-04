//
//  RXSelfRequestObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RXSelfRequestObject;
@protocol RXSelfRequestObjectDelegate <NSObject>

- (void)requesetFinished:(RXSelfRequestObject *)request;

@end


@interface RXSelfRequestObject : NSObject

@property (nonatomic, copy, nullable) void(^completionBlock)(RXSelfRequestObject *request);
@property (nonatomic, weak) id<RXSelfRequestObjectDelegate> delegate;
- (void)start;

@end

NS_ASSUME_NONNULL_END
