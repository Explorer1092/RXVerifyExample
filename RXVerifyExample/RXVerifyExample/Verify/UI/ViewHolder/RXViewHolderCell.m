//
//  RXViewHolderCell.m
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/12/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface RXViewHolderCell ()
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *gradientView;
@property (nonatomic, strong) UILabel *desLabel;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation RXViewHolderCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.parentView];
        [self.parentView addSubview:self.bgImageView];
        [self.parentView addSubview:self.gradientView];
        
//        [self.parentView addSubview:self.desLabel];
        [self.gradientView addSubview:self.desLabel];
        
        [self.parentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(@0);
            make.bottom.equalTo(@-20);
        }];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(@0);
        }];
        [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(@0);
        }];

        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@20);
        }];
    }
    return self;
}
- (void)refreshViewWithIndex:(NSInteger)index {
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:@"https://static.yximgs.com/udata/pkg/c0f04f06a2020297ad56fb7fea4fb5f4"]];
    
    
    NSString *text = @"是gradientView的子view";
    text = @"是gradientView的同级view";
    
    self.bgImageView.hidden = YES;
    
    self.desLabel.text = [NSString stringWithFormat:@"描述文案%zd，%@", index, text];
    [self updateGradientLayer];
}

- (void)updateGradientLayer {
    if (self.gradientView.frame.size.width > 0 && self.gradientLayer == nil) {
        // 初始化CAGradientlayer对象，使它的大小为UIView的大小
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.gradientView.bounds;

        // 将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.gradientView.layer addSublayer:self.gradientLayer];

        // 设置渐变区域的起始和终止位置（范围为0-1）
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);

        // 设置颜色数组
        self.gradientLayer.colors = @[
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor,
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor
        ];

//        self.imageView.hidden = YES;
        // 设置颜色分割点（范围：0-1）
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateConstraints];
}
#pragma mark - UI Getter
- (UIView *)parentView {
    if (!_parentView) {
        _parentView = [UIView new];
    }
    return _parentView;
}
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
    }
    return _bgImageView;
}
- (UIView *)gradientView {
    if (!_gradientView) {
        _gradientView = [UIView new];
    }
    return _gradientView;
}
- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [UILabel new];
        _desLabel.textColor = [UIColor whiteColor];
    }
    return _desLabel;
}
@end
