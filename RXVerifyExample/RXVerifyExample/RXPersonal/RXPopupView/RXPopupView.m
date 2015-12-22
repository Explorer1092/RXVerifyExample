//
//  RXPopupView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopupView.h"
#import "RXPopupBorderView.h"
#import "RXPopupArcView.h"
#import "RXPopupArcView.h"
#import "RXPopupRoute.h"
@interface RXPopupView ()

@property (nonatomic, strong) RXPopupBorderView *rxPopupBorderView;


@property (nonatomic, strong) RXPopupArcView *rxPopupArcView;

@end
@implementation RXPopupView





#pragma mark - Public
- (void)refreshView
{
    
    // http://www.tuicool.com/articles/mey2i2
    
    // 支持小的边框
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    NSMutableArray *borderAry = [NSMutableArray array];
    NSMutableArray *arcAry = [NSMutableArray array];
//    NSMutableArray *contentAry = [NSMutableArray array];
    
    
    
    
    
    
    CGFloat halfBorderWidth = self.borderWidth / 2.0f;
    CGFloat leftOffset = self.trianglePoint.x;
    CGFloat bottomOffset = self.trianglePoint.y;
    CGFloat rightOffset = self.trianglePoint.x;
    CGFloat topOffset = self.trianglePoint.y;
    
    
    
    RXPopupRoute *route = nil;
    
    
    
    CGFloat cornerRadius = self.cornerRadius;
    
    
    //    CGFloat arcRadius = cornerRadius + halfBorderWidth;
    
    
    // 覆盖了
    CGPoint left1 = CGPointMake(leftOffset + halfBorderWidth, cornerRadius + topOffset  );
    CGPoint left2 = CGPointMake(left1.x, height - cornerRadius - bottomOffset);
    
    route = [[RXPopupRoute alloc] init];
    route.startPoint = left1;
    route.routePoints = @[[NSValue valueWithCGPoint:left2]];
    [borderAry addObject:route];
    
    
    
    CGPoint right1 = CGPointMake(width - rightOffset - halfBorderWidth, left1.y);
    CGPoint right2 = CGPointMake(right1.x, left2.y);
    
    
    route = [[RXPopupRoute alloc] init];
    route.startPoint = right1;
    route.routePoints = @[[NSValue valueWithCGPoint:right2]];
    [borderAry addObject:route];
    
    
    CGPoint bottom1 = CGPointMake(left1.x + cornerRadius, height - bottomOffset - halfBorderWidth);
    bottom1 = CGPointMake(leftOffset + cornerRadius, height - bottomOffset - halfBorderWidth);
    CGPoint bottom2 = CGPointMake(right1.x - cornerRadius, bottom1.y);
    bottom2 = CGPointMake(width - rightOffset - cornerRadius, bottom1.y);
    
    
    route = [[RXPopupRoute alloc] init];
    route.startPoint = bottom1;
    route.routePoints = @[[NSValue valueWithCGPoint:bottom2]];
    [borderAry addObject:route];
    
    CGPoint top1 = CGPointMake(bottom1.x, topOffset + halfBorderWidth);
    CGPoint top2 = CGPointMake(bottom2.x, top1.y);
    
    CGPoint top20 = CGPointMake(width / 2 - self.trianglePoint.x, top1.y);
    CGPoint top21 = CGPointMake(width / 2, 0);
    CGPoint top22 = CGPointMake(width / 2 + self.trianglePoint.x, top1.y);
    
    route = [[RXPopupRoute alloc] init];
    route.startPoint = top1;
    route.routePoints = @[[NSValue valueWithCGPoint:top20], [NSValue valueWithCGPoint:top21], [NSValue valueWithCGPoint:top22], [NSValue valueWithCGPoint:top2]];
    [borderAry addObject:route];
    
    
    // ---- 分割线 ----
    
    CGFloat arcWidth = width - leftOffset - rightOffset;
    CGFloat arcHeight = height - topOffset - bottomOffset;
    
    
    // leftBottom
    // 用逆时针, frame已经变小了
    CGPoint leftBottom0 = CGPointMake(halfBorderWidth, arcHeight - cornerRadius - 1);
    CGPoint leftBottom1 = CGPointMake(leftBottom0.x, arcHeight);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = leftBottom0;
    route.routePoints = @[[NSValue valueWithCGPoint:leftBottom1]];
    [arcAry addObject:route];
    
    CGPoint leftBottom3 = CGPointMake(0, arcHeight - halfBorderWidth);
    CGPoint leftBottom4 = CGPointMake(cornerRadius + 1, leftBottom3.y);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = leftBottom3;
    route.routePoints = @[[NSValue valueWithCGPoint:leftBottom4]];
    [arcAry addObject:route];
    
    
    // rightBottom
    CGPoint rightBottom0 = CGPointMake(arcWidth - cornerRadius - 1, leftBottom3.y);
    CGPoint rightBottom1 = CGPointMake(arcWidth, rightBottom0.y);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = rightBottom0;
    route.routePoints = @[[NSValue valueWithCGPoint:rightBottom1]];
    [arcAry addObject:route];
    
    CGPoint rightBottom3 = CGPointMake(arcWidth - halfBorderWidth, leftBottom3.y);
    CGPoint rightBottom4 = CGPointMake(rightBottom3.x, arcWidth - cornerRadius - 1);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = rightBottom3;
    route.routePoints = @[[NSValue valueWithCGPoint:rightBottom4]];
    [arcAry addObject:route];
    
    
    
    // rightTop
    CGPoint rightTop0 = CGPointMake(arcWidth - halfBorderWidth, halfBorderWidth + cornerRadius + 1);
    CGPoint rightTop1 = CGPointMake(rightTop0.x, 0);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = rightTop0;
    route.routePoints = @[[NSValue valueWithCGPoint:rightTop1]];
    [arcAry addObject:route];
    
    CGPoint rightTop3 = CGPointMake(arcWidth, halfBorderWidth);
    CGPoint rightTop4 = CGPointMake(arcWidth - cornerRadius - 1, rightTop3.y);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = rightTop3;
    route.routePoints = @[[NSValue valueWithCGPoint:rightTop4]];
    [arcAry addObject:route];
    
    
    // leftTop
    CGPoint leftTop0 = CGPointMake(cornerRadius + halfBorderWidth + 1, halfBorderWidth);
    CGPoint leftTop1 = CGPointMake(0, leftTop0.y);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = leftTop0;
    route.routePoints = @[[NSValue valueWithCGPoint:leftTop1]];
    [arcAry addObject:route];
    
    CGPoint leftTop3 = CGPointMake(halfBorderWidth, 0);
    CGPoint leftTop4 = CGPointMake(leftTop3.x, halfBorderWidth + cornerRadius + 1);
    route = [[RXPopupRoute alloc] init];
    route.startPoint = leftTop3;
    route.routePoints = @[[NSValue valueWithCGPoint:leftTop4]];
    [arcAry addObject:route];
    
    
    self.rxPopupBorderView.frame = CGRectMake(0, 0, width, height);
    self.rxPopupBorderView.borderColor = self.borderColor;
    self.rxPopupBorderView.borderWidth = self.borderWidth;
    self.rxPopupBorderView.routes = borderAry;
    [self.rxPopupBorderView setNeedsDisplay];
    

    
    self.rxPopupArcView.frame = CGRectMake(leftOffset, topOffset, arcWidth, arcHeight);
    self.rxPopupArcView.borderColor = self.borderColor;
    self.rxPopupArcView.borderWidth = self.borderWidth;
    self.rxPopupArcView.routes = arcAry;
    
//    CGRect bounds = self.rxPopupArcView.bounds;
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = bounds;
//    maskLayer.path = maskPath.CGPath;
//    maskLayer.borderWidth = self.borderWidth;
//    maskLayer.borderColor = self.borderColor.CGColor;
//    maskLayer.masksToBounds = YES;
//    maskLayer.cornerRadius = self.cornerRadius;
    
//    self.rxPopupArcView.backgroundColor = [UIColor redColor];
//    self.rxPopupArcView.layer.mask = maskLayer;
    
    self.rxPopupArcView.layer.masksToBounds = YES;
    self.rxPopupArcView.layer.cornerRadius = self.cornerRadius;
//     一定是不能设置这两个属性!!!!!!,要不然又被重新绘制
    self.rxPopupArcView.layer.borderWidth = 1;
    self.rxPopupArcView.layer.borderColor = self.borderColor.CGColor;
    [self.rxPopupArcView setNeedsDisplay];
    
    
}

#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
//        self.layer.borderWidth = 1;
//        
//        self.layer.borderColor = [UIColor redColor].CGColor;
//        
        self.backgroundColor = [UIColor clearColor];
//
//        
//        self.rxPopupBorderView = [[RXPopupBorderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        
//        [self addSubview:self.rxPopupBorderView];
//        
//        
//        self.rxPopupArcView = [[RXPopupArcView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        
//        [self addSubview:self.rxPopupArcView];
        
        
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.borderColor setStroke];
    [[UIColor greenColor] setFill];
    
    
    CGFloat halfBorderWidth = self.borderWidth / 2.0f;
    CGFloat leftOffset = self.trianglePoint.x;
    CGFloat bottomOffset = self.trianglePoint.y;
    CGFloat rightOffset = self.trianglePoint.x;
    CGFloat topOffset = self.trianglePoint.y;
    
    
    CGFloat cornerRadius = self.cornerRadius;

    
    CGPoint left1 = CGPointMake(leftOffset + halfBorderWidth, cornerRadius + topOffset  );
    CGPoint left2 = CGPointMake(left1.x, height - cornerRadius - bottomOffset);
    
    
    CGPoint right1 = CGPointMake(width - rightOffset - halfBorderWidth, left1.y);
//    CGPoint right2 = CGPointMake(right1.x, left2.y);
    
    
    CGPoint bottom1 = CGPointMake(leftOffset + cornerRadius, height - bottomOffset - halfBorderWidth);
    CGPoint bottom2 = CGPointMake(width - rightOffset - cornerRadius, bottom1.y);
    
    
    CGPoint top1 = CGPointMake(bottom1.x, topOffset + halfBorderWidth);
//    CGPoint top2 = CGPointMake(bottom2.x, top1.y);
    
    
    
    CGContextMoveToPoint(context, left1.x, left1.y);
    CGContextAddLineToPoint(context, left2.x, left2.y);
    
    
    CGPoint leftBottom = CGPointMake(leftOffset + cornerRadius, height - cornerRadius - bottomOffset);
    CGContextAddArc(context, leftBottom.x, leftBottom.y, cornerRadius, M_PI, M_PI_2, 1);
    CGContextSetLineWidth(context, self.borderWidth * 2);
    

    CGContextAddLineToPoint(context, bottom2.x, bottom2.y);
    
    CGPoint rightBottom = CGPointMake(width - cornerRadius - rightOffset, leftBottom.y);
    CGContextAddArc(context, rightBottom.x, rightBottom.y, cornerRadius, M_PI_2, 0, 1);
    
    CGContextAddLineToPoint(context, right1.x, right1.y);
    
    CGPoint rightTop = CGPointMake(rightBottom.x, cornerRadius + topOffset);
    CGContextAddArc(context, rightTop.x, rightTop.y, cornerRadius, 0, 1.5 * M_PI, 1);
    
    
    CGContextAddLineToPoint(context, width / 2 + self.trianglePoint.x, top1.y);
    CGContextAddLineToPoint(context, width / 2, 0);
    CGContextAddLineToPoint(context, width / 2 - self.trianglePoint.x, top1.y);
    CGContextAddLineToPoint(context, top1.x, top1.y);
    
    CGPoint leftTop = CGPointMake(leftBottom.x, rightTop.y);
    CGContextAddArc(context, leftTop.x, leftTop.y, cornerRadius, 1.5 * M_PI, M_PI, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

    
    
    
}




@end
