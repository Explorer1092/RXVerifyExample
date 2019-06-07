//
//  VKRaptorView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKRaptorView.h"
#import "VKViewSchedule.h"
#import "Masonry.h"
@interface VKRaptorView()

@property (nonatomic, strong) VKViewSchedule *viewSchedule;

@property (nonatomic, strong) UIView *pptView;
@property (nonatomic, strong) UIView *teacherView;
@property (nonatomic, strong) UIView *studentView;
@property (nonatomic, strong) UIView *guideView;
@property (nonatomic, strong) UIView *animationView;

@end

@implementation VKRaptorView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.viewSchedule = [[VKViewSchedule alloc] initWithRaptorView:self];
        
        
        
        self.pptView = [UIView new];
        self.pptView.backgroundColor = [UIColor redColor];
        UIView *bgLevelView = [self.viewSchedule addToBgViewWithView:self.pptView];
        [self.pptView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgLevelView).offset(0);
            make.left.equalTo(bgLevelView).offset(0);
            make.right.equalTo(bgLevelView).offset(0);
            make.bottom.equalTo(bgLevelView).offset(0);
        }];
        
        
//        [self.pptView convertRect:self.pptView.frame fromView:self];
        
        self.teacherView = [UIView new];
        self.teacherView.backgroundColor = [UIColor greenColor];
        UIView *normalLevelView = [self.viewSchedule addToNormalViewWithView:self.teacherView];
        [self.teacherView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(normalLevelView).offset(0);
            make.left.equalTo(normalLevelView).offset(0);
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));
        }];
        
        
        
        
        self.guideView = [UIView new];
        self.guideView.backgroundColor = [UIColor blueColor];
        UIView *guideLevelView = [self.viewSchedule addToGuideViewWithView:self.guideView];
        [self.guideView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(guideLevelView).offset(0);
            make.right.equalTo(guideLevelView).offset(0);
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));
        }];
        
        self.animationView = [UIView new];
        self.animationView.backgroundColor = [UIColor yellowColor];
        UIView *animationLevelView = [self.viewSchedule addToAnimationViewWithView:self.animationView];
        [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(animationLevelView).offset(0);
            make.bottom.equalTo(animationLevelView).offset(0);
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));
        }];
        
        
    }
    return self;
}

@end
