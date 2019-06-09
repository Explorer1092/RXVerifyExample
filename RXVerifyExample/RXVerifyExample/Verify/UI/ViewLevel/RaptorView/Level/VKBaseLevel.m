//
//  VKBaseLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBaseLevel.h"
@interface VKBaseLevel()

@property (nonatomic, readwrite, strong) UIView *placeholderView;
@end
@implementation VKBaseLevel

- (id)initWithSuperview:(UIView *)superview {
    if (self = [super init]) {
        self.placeholderView = [UIView new];
        [superview addSubview:self.placeholderView];
    }
    return self;
}

@end
