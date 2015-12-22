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
    
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    NSMutableArray *borderAry = [NSMutableArray array];
    NSMutableArray *arcAry = [NSMutableArray array];
    NSMutableArray *contentAry = [NSMutableArray array];
    
    
    
    
    
    
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
    
    
    
    
    
    self.rxPopupBorderView.frame = CGRectMake(0, 0, width, height);
    self.rxPopupBorderView.borderColor = self.borderColor;
    self.rxPopupBorderView.borderWidth = self.borderWidth;
    self.rxPopupBorderView.routes = borderAry;
    [self.rxPopupBorderView setNeedsDisplay];
    

    
    self.rxPopupArcView.frame = CGRectMake(0, 0, width, height);
    self.rxPopupArcView.borderColor = self.borderColor;
    self.rxPopupArcView.borderWidth = self.borderWidth;
    self.rxPopupArcView.routes = borderAry;
    [self.rxPopupBorderView setNeedsDisplay];
    
    
}

#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 1;
        
        self.layer.borderColor = [UIColor redColor].CGColor;
        
        self.backgroundColor = [UIColor clearColor];
        
        
        self.rxPopupBorderView = [[RXPopupBorderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:self.rxPopupBorderView];
        
        
        self.rxPopupArcView = [[RXPopupArcView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:self.rxPopupArcView];
        
        
        
    }
    return self;
}





@end
