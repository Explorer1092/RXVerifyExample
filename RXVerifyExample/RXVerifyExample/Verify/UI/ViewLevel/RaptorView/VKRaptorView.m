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

//@property (nonatomic, strong) UIView *pptView;
//@property (nonatomic, strong) UIView *teacherView;
//@property (nonatomic, strong) UIView *studentView;
//@property (nonatomic, strong) UIView *guideView;
//@property (nonatomic, strong) UIView *animationView;

@end

@implementation VKRaptorView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.viewSchedule = [[VKViewSchedule alloc] initWithRaptorView:self];
        
//
//
//        self.pptView = [UIView new];
//        self.pptView.backgroundColor = [UIColor redColor];
//        UIView *bgLevel = [self.viewSchedule addToBgViewWithView:self.pptView];
//        [self.pptView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(bgLevel).offset(0);
//            make.left.equalTo(bgLevel).offset(0);
//            make.right.equalTo(bgLevel).offset(0);
//            make.bottom.equalTo(bgLevel).offset(0);
//        }];
//
//
////        [self.pptView convertRect:self.pptView.frame fromView:self];
//
//        self.teacherView = [UIView new];
//        self.teacherView.backgroundColor = [UIColor greenColor];
//        UIView *normalLevel = [self.viewSchedule addToNormalViewWithView:self.teacherView];
//        [self.teacherView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(normalLevel).offset(0);
//            make.left.equalTo(normalLevel).offset(0);
//            make.width.equalTo(@(200));
//            make.height.equalTo(@(200));
//        }];
//
//
//
//
//        self.guideView = [UIView new];
//        self.guideView.backgroundColor = [UIColor blueColor];
//        UIView *guideLevel = [self.viewSchedule addToGuideViewWithView:self.guideView];
//        [self.guideView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(guideLevel).offset(0);
//            make.right.equalTo(guideLevel).offset(0);
//            make.width.equalTo(@(200));
//            make.height.equalTo(@(200));
//        }];
//
//        self.animationView = [UIView new];
//        self.animationView.backgroundColor = [UIColor yellowColor];
//        UIView *animationLevel = [self.viewSchedule addToAnimationViewWithView:self.animationView];
//        [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(animationLevel).offset(0);
//            make.bottom.equalTo(animationLevel).offset(0);
//            make.width.equalTo(@(200));
//            make.height.equalTo(@(200));
//        }];
//
        
    }
    return self;
}

@end
