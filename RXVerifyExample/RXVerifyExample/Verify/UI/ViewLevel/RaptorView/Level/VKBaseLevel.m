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
- (NSArray *)possibleSubviews {
    return [NSArray new];
}
- (NSArray *)subviews {
    NSMutableArray *mutAry = [NSMutableArray new];
    for (UIView *view in self.possibleSubviews) {
        if (view.superview != nil) {
            [mutAry addObject:view];
        }
    }
    return [mutAry copy];
}
- (BOOL)empty {
    return self.subviews.count == 0;
}

@end
