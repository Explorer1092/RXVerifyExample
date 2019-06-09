//
//  VKViewSchedule.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKViewSchedule.h"
#import "VKBGLevel.h"
#import "VKNormalLevel.h"
#import "VKGuideLevel.h"
#import "VKAnimationLevel.h"
#import "Masonry.h"
@interface VKViewSchedule()
@property (nonatomic, strong) VKBGLevel *bgLevel;
@property (nonatomic, strong) VKNormalLevel *normalLevel;
@property (nonatomic, strong) VKGuideLevel *guideLevel;
@property (nonatomic, strong) VKAnimationLevel *animationLevel;
@end

@implementation VKViewSchedule


#pragma mark - Constructor And Destructor
- (id)initWithRaptorView:(UIView *)raptorView {
    if (self = [super init]) {
        self.bgLevel = [[VKBGLevel alloc] initWithSuperview:raptorView];
        self.normalLevel = [[VKNormalLevel alloc] initWithSuperview:raptorView];
        self.guideLevel = [[VKGuideLevel alloc] initWithSuperview:raptorView];
        self.animationLevel = [[VKAnimationLevel alloc] initWithSuperview:raptorView];
    }
    return self;
}

@end
