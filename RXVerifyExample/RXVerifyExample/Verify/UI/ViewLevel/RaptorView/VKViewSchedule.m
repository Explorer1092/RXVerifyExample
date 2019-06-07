//
//  VKViewSchedule.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKViewSchedule.h"
#import "VKBGLevelView.h"
#import "VKNormalLevelView.h"
#import "VKGuideLevelView.h"
#import "VKAnimationLevelView.h"
#import "Masonry.h"
@interface VKViewSchedule()
@property (nonatomic, strong) VKBGLevelView *bgView;
@property (nonatomic, strong) VKNormalLevelView *normalView;
@property (nonatomic, strong) VKGuideLevelView *guideView;
@property (nonatomic, strong) VKAnimationLevelView *animationView;
@end

@implementation VKViewSchedule

#pragma mark - Public
- (UIView *)addToBgViewWithView:(UIView *)view {
    return [self _pvk_addView:view toView:self.bgView];
}
- (UIView *)addToNormalViewWithView:(UIView *)view {
    return [self _pvk_addView:view toView:self.normalView];
}
- (UIView *)addToGuideViewWithView:(UIView *)view {
    return [self _pvk_addView:view toView:self.guideView];
}
- (UIView *)addToAnimationViewWithView:(UIView *)view {
    return [self _pvk_addView:view toView:self.animationView];
}

- (void)removeView:(UIView *)subView {
    UIView *superView = subView.superview;
    [subView removeFromSuperview];
    NSArray *subViews = superView.subviews;
    if (subViews.count == 0) {
        superView.hidden = YES;
    }
}

#pragma mark - Private
- (UIView *)_pvk_addView:(UIView *)view toView:(UIView *)toView {
    toView.hidden = NO;
    [toView addSubview:view];
    return toView;
}

#pragma mark - Constructor And Destructor
- (id)initWithRaptorView:(UIView *)raptorView {
    if (self = [super init]) {
        self.bgView = [VKBGLevelView new];
        self.normalView = [VKNormalLevelView new];
        self.guideView = [VKGuideLevelView new];
        self.animationView = [VKAnimationLevelView new];
        
        NSArray *viewAry = @[self.bgView, self.normalView, self.guideView, self.animationView];
        for (UIView *tmpView in viewAry) {
            [raptorView addSubview:tmpView];
            tmpView.hidden = YES;
            [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(raptorView).offset(0);
                make.left.equalTo(raptorView).offset(0);
                make.right.equalTo(raptorView).offset(0);
                make.bottom.equalTo(raptorView).offset(0);
            }];
        }
        
    }
    return self;
}

@end
