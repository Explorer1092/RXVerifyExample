//
//  RXMasonryCase10ViewController.m
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase10ViewController.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase10ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;
@property (nonatomic, strong) UILabel *tipLabel;

@property (nonatomic, strong) MASConstraint *centerXConstraint;
@property (nonatomic, strong) MASConstraint *centerYConstraint;

@end

@implementation RXMasonryCase10ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _containerView.layer.masksToBounds = YES;
    _containerView.layer.borderWidth = 1.0f;
    _containerView.layer.borderColor = [UIColor redColor].CGColor;
    
    self.tipLabel.text = @"tutuge.me\niOS";
    [_containerView addSubview:self.tipLabel];
    // 这里设置了Size
    [_tipLabel sizeToFit];
    
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置边界条件约束，保证内容可见，优先级1000
        make.left.greaterThanOrEqualTo(_containerView.mas_left);
        make.right.lessThanOrEqualTo(_containerView.mas_right);
        make.top.greaterThanOrEqualTo(_containerView.mas_top);
        make.bottom.lessThanOrEqualTo(_containerView.mas_bottom);
        
        _centerXConstraint = make.centerX.equalTo(_containerView.mas_left).with.offset(100).priorityHigh(); // 优先级要比边界条件低
        _centerYConstraint = make.centerY.equalTo(_containerView.mas_top).with.offset(100).priorityHigh(); // 优先级要比边界条件低
        make.width.mas_equalTo(CGRectGetWidth(_tipLabel.frame) + 8);
        make.height.mas_equalTo(CGRectGetHeight(_tipLabel.frame) + 4);
    }];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panWithGesture:)];
    [_containerView addGestureRecognizer:pan];
}

#pragma mark - Pan gesture

- (void)panWithGesture:(UIPanGestureRecognizer *)pan {
    CGPoint touchPoint = [pan locationInView:_containerView];
    _logLabel.text = NSStringFromCGPoint(touchPoint);
    
    _centerXConstraint.offset = touchPoint.x;
    _centerYConstraint.offset = touchPoint.y;
}

#pragma mark - Getter

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.textColor = [UIColor whiteColor];
        _tipLabel.font = [UIFont systemFontOfSize:20];
        _tipLabel.numberOfLines = 2;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1];
        _tipLabel.layer.borderColor = [UIColor blackColor].CGColor;
        _tipLabel.layer.borderWidth = 1.0f;
        _tipLabel.layer.masksToBounds = YES;
        _tipLabel.layer.cornerRadius = 2.0f;
    }
    return _tipLabel;
}

@end
