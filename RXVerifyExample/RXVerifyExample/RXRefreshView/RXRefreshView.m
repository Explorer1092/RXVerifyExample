//
//  RXRefreshView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXRefreshView.h"
#import "RXItemView.h"

@interface RXRefreshView ()

@property (nonatomic, strong) NSArray *aryItem;

@end

@implementation RXRefreshView





+ (id)attachToScrollView:(UIScrollView *)scrollView
{
    
    
    
    // EECAR
    NSArray *allAry = @[@"{0,0}:{20,0}",
                        @"{0,0}:{0,25}",
                        @"{0,12.5}:{20,12.5}",
                        @"{0,25}:{20,25}",
                        
                        @"{24,0}:{44,0}",
                        @"{24,0}:{24,25}",
                        @"{24,12.5}:{45,12.5}",
                        @"{24,25}:{44,25}",
                        
                        @"{48,0}:{68,0}",
                        @"{48,0}:{48,25}",
                        @"{48,25}:{68,25}",
                        
                        @"{72,0}:{92,0}",
                        @"{72,0}:{72,25}",
                        @"{72,12.5}:{92,12.5}",
                        @"{91,0}:{91,25}",
                        
                        @"{96,0}:{116,0}",
                        @"{96,0}:{96,25}",
                        @"{114.75,0}:{114.75,12.5}",
                        @"{96,12.5}:{116,12.5}",
                        @"{106,12.5}:{116,25}"
                        ];
    
    NSMutableArray *startPoints = [NSMutableArray array];
    NSMutableArray *endPoints = [NSMutableArray array];
    for (NSString *str in allAry) {
        NSArray *tmpAry = [str componentsSeparatedByString:@":"];
        [startPoints addObject:tmpAry[0]];
        [endPoints addObject:tmpAry[1]];
    }
    
    
    
    
    CGFloat width = 0;
    CGFloat height = 0;
    for (NSInteger i = 0; i < startPoints.count; i++) {
        CGPoint startPoint = CGPointFromString(startPoints[i]);
        CGPoint endPoint = CGPointFromString(endPoints[i]);
        if (startPoint.x > width) width = startPoint.x;
        if (endPoint.x > width) width = endPoint.x;
        if (startPoint.y > height) height = startPoint.y;
        if (endPoint.y > height) height = endPoint.y;
    }
    
    CGRect frame = CGRectMake(0, 0, width, height);
    
    RXRefreshView *refreshView = [[RXRefreshView alloc] init];
    
    NSMutableArray *ary = [NSMutableArray array];
    for (NSInteger i = 0; i < startPoints.count; i++) {
        CGPoint startPoint = CGPointFromString(startPoints[i]);
        CGPoint endPoint = CGPointFromString(endPoints[i]);
        
        RXItemView *itemView = [[RXItemView alloc] initWithFrame:frame startPoint:startPoint endPoint:endPoint color:[UIColor whiteColor] lineWidth:2.5];
        
        itemView.tag = i;
        itemView.backgroundColor = [UIColor clearColor];
        itemView.alpha = 0;
        [ary addObject:itemView];
        [refreshView addSubview:itemView];
    }
    
    refreshView.aryItem = ary;
    refreshView.frame = frame;
    refreshView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0f, 0);
    
    
    refreshView.backgroundColor = [UIColor redColor];
    
    [scrollView addSubview:refreshView];
    
    return refreshView;
}










@end
