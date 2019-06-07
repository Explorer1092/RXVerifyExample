//
//  VKViewSchedule.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKViewSchedule : NSObject


#pragma mark - Public
- (UIView *)addToBgViewWithView:(UIView *)view;
- (UIView *)addToNormalViewWithView:(UIView *)view;
- (UIView *)addToGuideViewWithView:(UIView *)view;
- (UIView *)addToAnimationViewWithView:(UIView *)view;
- (void)removeView:(UIView *)subView;
- (id)initWithRaptorView:(UIView *)raptorView;
@end

NS_ASSUME_NONNULL_END
