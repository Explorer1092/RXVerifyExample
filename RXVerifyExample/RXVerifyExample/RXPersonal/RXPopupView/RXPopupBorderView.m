//
//  RXPopupBorderView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopupBorderView.h"
#import "RXPopupRoute.h"
@implementation RXPopupBorderView



- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.borderWidth);
    // 用这个方法
    [self.borderColor setStroke];
    NSInteger count = self.routes.count;
    for (NSInteger i = 0; i < count; i++) {
        RXPopupRoute *route = self.routes[i];
        CGContextMoveToPoint(context, route.startPoint.x, route.startPoint.y);
        for (NSValue *value in route.routePoints) {
            CGPoint point = [value CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    CGContextDrawPath(context, kCGPathStroke);
    
}
#pragma mark - Constructor And Destructor

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



@end
