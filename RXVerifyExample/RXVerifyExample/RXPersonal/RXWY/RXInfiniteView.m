//
//  RXInfiniteView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXInfiniteView.h"

@interface RXInfiniteView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;



@end

@implementation RXInfiniteView

#pragma mark - Proverty
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}



- (void)reloadData
{
//    CGFloat width = self.frame.size.width;
//    CGFloat height = self.frame.size.height;
}


#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame type:(E_RX_InfiniteViewType)type
{
    if (self = [super initWithFrame:frame]) {
        self.e_RX_InfiniteViewType = type;
    }
    return self;
}


@end
