//
//  RXPopupBoxBackgroundView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/21.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopupBoxBackgroundView.h"

@implementation RXPopupBoxBackgroundView


- (void)refreshView
{
    CGRect bounds = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    

}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
//    return;
    
    CGContextRef content = UIGraphicsGetCurrentContext();

    
    CGContextSetLineWidth(content, self.borderWidth);
//    // 用这个方法
    [self.borderColor setStroke];
    
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat halfBorderWidth = self.borderWidth / 2.0f;

    
    CGPoint left1 = CGPointMake(halfBorderWidth, self.borderWidth);
    CGPoint left2 = CGPointMake(left1.x, height - self.borderWidth);
    
    CGPoint bottom1 = CGPointMake(0, height - halfBorderWidth);
    CGPoint bottom2 = CGPointMake(width, bottom1.y);
    
    CGPoint right1 = CGPointMake(width - halfBorderWidth, left1.y);
    CGPoint right2 = CGPointMake(right1.x, left2.y);
    
    
    CGPoint top1 = CGPointMake(bottom1.x, halfBorderWidth);
    CGPoint top2 = CGPointMake(bottom2.x, top1.y);
    
    // 左线
    CGContextMoveToPoint(content, left1.x, left1.y);
    CGContextAddLineToPoint(content, left2.x, left2.y);
    

    // 下线
    CGContextMoveToPoint(content, bottom1.x, bottom1.y);
    CGContextAddLineToPoint(content, bottom2.x, bottom2.y);
    
    
    // 右线
    CGContextMoveToPoint(content, right1.x, right1.y);
    CGContextAddLineToPoint(content, right2.x, right2.y);
    
    
    // 此处是多余的,但是不影响?????
    // 上线
    CGContextMoveToPoint(content, top1.x, top1.y);
    CGContextAddLineToPoint(content, top1.x + self.cornerRadius, top1.y);
    
    
    
    CGContextMoveToPoint(content, top2.x - self.cornerRadius, top2.y);
    CGContextAddLineToPoint(content, top2.x, top2.y);
    
    CGContextDrawPath(content, kCGPathStroke);
    
    
    
}

@end
