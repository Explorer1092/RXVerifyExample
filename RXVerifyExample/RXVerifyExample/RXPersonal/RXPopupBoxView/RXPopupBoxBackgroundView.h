//
//  RXPopupBoxBackgroundView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/21.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXPopupBoxBackgroundView : UIView



@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) CGFloat cornerRadius;
- (void)refreshView;


@end
