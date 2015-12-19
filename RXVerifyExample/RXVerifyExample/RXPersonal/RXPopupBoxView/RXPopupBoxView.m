//
//  RXPopupBoxView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopupBoxView.h"

@interface RXPopupBoxView ()




@end

@implementation RXPopupBoxView





#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    [super drawRect:rect];
    CGContextRef content = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(content, self.lineWidth);
//    [self.lineColor setStroke];
//
//    [self.bgColor setFill];
    
    CGContextSetStrokeColorWithColor(content, self.lineColor.CGColor);
    CGContextSetFillColorWithColor(content, self.bgColor.CGColor);
    

//    CGContextMoveToPoint(content, 0, 0);
//    CGContextAddLineToPoint(content, 0, 100);
    CGContextAddRect(content, self.bounds);
    
    
//    CGContextAddLineToPoint(content, 96, 96);
//    CGContextAddLineToPoint(content, 96, 0);
//    CGContextAddLineToPoint(content, 0, 0);
    
//    CGContextStrokePath(content);
//    CGContextFillPath(content);
    
    CGContextDrawPath(content, kCGPathFillStroke);
    
}



@end
