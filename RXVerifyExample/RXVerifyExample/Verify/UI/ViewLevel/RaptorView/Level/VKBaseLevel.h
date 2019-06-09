//
//  VKBaseLevel.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKBaseLevel : NSObject

@property (nonatomic, readonly) UIView *placeholderView;

- (id)initWithSuperview:(UIView *)superview;

@end

NS_ASSUME_NONNULL_END
