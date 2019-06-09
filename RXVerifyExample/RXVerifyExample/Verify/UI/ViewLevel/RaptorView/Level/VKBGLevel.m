//
//  VKBGLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBGLevel.h"
#import "Masonry.h"
@interface VKBGLevel()

@property (nonatomic, strong) UILabel *pptLabel;
@property (nonatomic, strong) UILabel *ppt2Label;

@end

@implementation VKBGLevel

- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.pptLabel = [UILabel new];
        self.pptLabel.text = @"我是背景图";
        self.pptLabel.textAlignment = NSTextAlignmentCenter;
        
        [superview insertSubview:self.pptLabel belowSubview:self.placeholderView];
        
        
        self.ppt2Label = [UILabel new];
        self.ppt2Label.text = @"我是背景图2";
        self.ppt2Label.backgroundColor = [UIColor whiteColor];
        self.ppt2Label.textAlignment = NSTextAlignmentCenter;
        [superview insertSubview:self.ppt2Label belowSubview:self.placeholderView];
        
        [self.pptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];

        [self.ppt2Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];

        
    }
    return self;
}

- (NSArray *)possibleSubviews {
    NSMutableArray *ary = [NSMutableArray new];
    if (self.pptLabel) {
        [ary addObject:self.pptLabel];
    }
    return [ary copy];
}
@end
