//
//  RXPopupBoxView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum E_RXPopupBoxViewStyle{
    kE_RXPopupBoxViewStyle_TopCenter        =       1,
    kE_RXPopupBoxViewStyle_LeftCenter,
    kE_RXPopupBoxViewStyle_BottomCenter,
    kE_RXPopupBoxViewStyle_RightCenter,
    kE_RXPopupBoxViewStyle_Top              =       1 << 3,
    kE_RXPopupBoxViewStyle_Left             =       1 << 4,
    kE_RXPopupBoxViewStyle_Bottom           =       1 << 5,
    kE_RXPopupBoxViewStyle_Right            =       1 << 6,
}E_RXPopupBoxView_Style;


@interface RXPopupBoxView : UIView



@property (nonatomic, assign) E_RXPopupBoxView_Style e_RXPopupBoxView_Style;
// 四种情况
@property (nonatomic, assign) CGPoint trianglePoint;
//// x or y offset
//// 只有是 Top,Left,Bottom,Right 中的一种或者几种才有效
//@property (nonatomic, assign) CGFloat offset;


@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;




// 需要设置圆角请用layer的cornerRadius去设置


@end
