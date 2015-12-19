//
//  RXPopupBoxView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum E_RXPopupBoxViewStyle{
    kE_RXPopupBoxViewStyle_TopCenter,
    kE_RXPopupBoxViewStyle_LeftCenter,
    kE_RXPopupBoxViewStyle_BottomCenter,
    kE_RXPopupBoxViewStyle_RightCenter,
    kE_RXPopupBoxViewStyle_Custome,
}E_RXPopupBoxView_Style;


@interface RXPopupBoxView : UIView



@property (nonatomic, assign) E_RXPopupBoxView_Style e_RXPopupBoxView_Style;
// 四种情况,坐标系
@property (nonatomic, assign) CGPoint trianglePoint;
// x or y offset
@property (nonatomic, assign) CGFloat offset;


@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, assign) CGFloat cornerRadius;



@end
