//
//  RXPopupBorderView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

// 负责画所有直线边框
@class RXPopupRoute;
@interface RXPopupBorderView : UIView

@property (nonatomic, strong) NSArray *routes;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;



@end
