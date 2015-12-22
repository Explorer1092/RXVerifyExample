//
//  RXPopupView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXPopupView : UIView


@property (nonatomic, assign) CGPoint trianglePoint;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;


@property (nonatomic, strong) UIColor *borderColor;

#pragma mark - Public
- (void)refreshView;
@end
