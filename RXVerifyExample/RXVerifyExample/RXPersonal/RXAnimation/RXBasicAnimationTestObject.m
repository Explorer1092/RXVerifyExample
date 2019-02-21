//
//  RXBasicAnimationTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBasicAnimationTestObject.h"

@implementation RXBasicAnimationTestObject

- (void)testInView:(UIView *)view {
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.duration = 0;// 动画持续时间,当等于0的时候,好像是0.25, 当小于0.1大于0的时候好像是0.1
    //动画起始值和终止值的设置
    moveAnimation.fromValue = @(view.center.x);
    moveAnimation.toValue = @(view.center.x+100);
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    moveAnimation.repeatCount = 10;
    moveAnimation.repeatDuration = 1;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:moveAnimation forKey:@"abc"];
}

@end
