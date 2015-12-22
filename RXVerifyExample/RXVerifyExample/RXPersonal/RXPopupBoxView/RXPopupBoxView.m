//
//  RXPopupBoxView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopupBoxView.h"
#import <UIKit/UIKit.h>
#import "RXPopupBoxBackgroundView.h"
@interface RXPopupBoxView ()




@property (nonatomic, strong) RXPopupBoxBackgroundView *backgroundView;



@end

@implementation RXPopupBoxView



#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        
        self.backgroundView = [[RXPopupBoxBackgroundView alloc] init];
        [self addSubview:self.backgroundView];
        
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];

        
    }
    return self;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    

}




- (void)drawRect:(CGRect)rect
{
    
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGContextSetLineWidth(context, self.borderWidth);
    
    
    // 用这个方法
    [self.borderColor setStroke];
    
    [[UIColor greenColor] setFill];
    // 或者这个方法
    //    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    //    CGContextSetFillColorWithColor(context, self.bgColor.CGColor);
    
    // 方法一
    //    CGContextAddRect(context, self.bounds);
    
    // 方法二
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 0, height);
//    CGContextAddLineToPoint(context, width, height);
//    CGContextAddLineToPoint(context, width, 0);
//    CGContextAddLineToPoint(context, 0, 0);
//    CGContextDrawPath(context, kCGPathStroke);
    
    CGFloat halfBorderWidth = self.borderWidth / 2.0f;
    CGFloat leftOffset = self.trianglePoint.x;
    CGFloat bottomOffset = self.trianglePoint.y;
    CGFloat rightOffset = self.trianglePoint.x;
    CGFloat topOffset = self.trianglePoint.y;
    
    
    
    CGFloat cornerRadius = 20;
    
    
//    CGFloat arcRadius = cornerRadius + halfBorderWidth;
    
    
    // 覆盖了
    CGPoint left1 = CGPointMake(leftOffset + halfBorderWidth, cornerRadius + topOffset  + halfBorderWidth);
    CGPoint left2 = CGPointMake(left1.x, height - cornerRadius - bottomOffset - halfBorderWidth);
    
    CGPoint bottom1 = CGPointMake(cornerRadius + leftOffset + self.borderWidth, height - bottomOffset - halfBorderWidth);
    CGPoint bottom2 = CGPointMake(width - cornerRadius - rightOffset - self.borderWidth, bottom1.y);
    
    CGPoint right1 = CGPointMake(width - rightOffset - halfBorderWidth, left1.y);
    CGPoint right2 = CGPointMake(right1.x, left2.y);

    
    CGPoint top1 = CGPointMake(bottom1.x, topOffset + halfBorderWidth);
    CGPoint top2 = CGPointMake(bottom2.x, top1.y);
    
    // 左线
    CGContextMoveToPoint(context, left1.x, left1.y);
    CGContextAddLineToPoint(context, left2.x, left2.y);
    
//    // 左下角圆弧
//    CGPoint leftBottom = CGPointMake(arcRadius + left1.x, bottom1.y - arcRadius);
//    CGContextAddArc(context, leftBottom.x, leftBottom.y, arcRadius, M_PI, M_PI_2, 1);

    

    // 下线
    CGContextMoveToPoint(context, bottom1.x, bottom1.y);
    CGContextAddLineToPoint(context, bottom2.x, bottom2.y);
    
    
    // 右线
    CGContextMoveToPoint(context, right1.x, right1.y);
    CGContextAddLineToPoint(context, right2.x, right2.y);
    
    
    // 此处是多余的,但是不影响?????
    // 上线
    CGContextMoveToPoint(context, top1.x, top1.y);
    
    
    CGContextAddLineToPoint(context, width / 2 - self.trianglePoint.x, top1.y);
    CGContextAddLineToPoint(context, width / 2, 0);
    CGContextAddLineToPoint(context, width / 2 + self.trianglePoint.x, top1.y);
    
    
    CGContextAddLineToPoint(context, top2.x, top2.y);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    
//    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    
    
    self.backgroundView.frame = CGRectMake(left1.x - halfBorderWidth, top1.y - halfBorderWidth, right1.x - left1.x + self.borderWidth, bottom1.y - top1.y + self.borderWidth);
    self.backgroundView.borderWidth = self.borderWidth;
    self.backgroundView.borderColor = self.borderColor;
    self.backgroundView.cornerRadius = cornerRadius;
    [self.backgroundView refreshView];
    
    
    
//    self.backgroundView.backgroundColor = [UIColor redColor];
//    
//    CGRect bounds = self.backgroundView.bounds;
//    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.backgroundView.layer.mask = maskLayer;
    
    
    
    // 方法三
    // 线和圆弧一起画,当前用不到
//    CGFloat cornerRadius = 10;
//    CGPoint left1 = CGPointMake(0, cornerRadius);
//    CGPoint left2 = CGPointMake(0, height - cornerRadius);
//    CGContextMoveToPoint(context, left1.x, left1.y);
//    CGContextAddLineToPoint(context, left2.x, left2.y);
//    
//    
//    CGPoint leftBottom = CGPointMake(cornerRadius, height - cornerRadius);
//    CGContextAddArc(context, leftBottom.x, leftBottom.y, cornerRadius, M_PI, M_PI_2, 1);
//    CGContextSetLineWidth(context, self.borderWidth * 2);
//    
//    CGPoint bottom2 = CGPointMake(width - cornerRadius, height);
//    CGContextAddLineToPoint(context, bottom2.x, bottom2.y);
//    
//    CGPoint rightBottom = CGPointMake(width - cornerRadius, height - cornerRadius);
//    CGContextAddArc(context, rightBottom.x, rightBottom.y, cornerRadius, M_PI_2, 0, 1);
//    
//    CGPoint right1 = CGPointMake(width, cornerRadius);
//    CGContextAddLineToPoint(context, right1.x, right1.y);
//    
//    CGPoint rightTop = CGPointMake(width - cornerRadius, cornerRadius);
//    CGContextAddArc(context, rightTop.x, rightTop.y, cornerRadius, 0, 1.5 * M_PI, 1);
//    
//    CGPoint top1 = CGPointMake(cornerRadius, 0);
//    CGContextAddLineToPoint(context, top1.x, top1.y);
//    
//    CGPoint leftTop = CGPointMake(cornerRadius, cornerRadius);
//    CGContextAddArc(context, leftTop.x, leftTop.y, cornerRadius, 1.5 * M_PI, M_PI, 1);
//    CGContextClosePath(context);
//    CGContextDrawPath(context, kCGPathFillStroke);
    
}



@end
