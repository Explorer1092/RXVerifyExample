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

@property (nonatomic, readonly) NSArray *subviews;
@property (nonatomic, readonly) BOOL empty;

- (id)initWithSuperview:(UIView *)superview;



// Need Override
@property (nonatomic, readonly) NSArray *possibleSubviews;

@end

NS_ASSUME_NONNULL_END
