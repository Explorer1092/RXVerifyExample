//
//  RXInfiniteView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
// 无限的一个scrollerView



@protocol RXInfiniteViewDataSource;





@interface RXInfiniteView : UIView

@property (nonatomic, weak) id<RXInfiniteViewDataSource> dataSource;


- (id)initWithFrame:(CGRect)frame;


// 当前数据
@property (nonatomic, strong) id curData;
- (void)reloadData;


@end



@protocol RXInfiniteViewDataSource <NSObject>



- (UIView *)curViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView;
- (UIView *)preViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView;
- (UIView *)nextViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView;

- (id)preDataInRXInfiniteView:(RXInfiniteView *)infiniteView;
- (id)nextDataInRXInfiniteView:(RXInfiniteView *)infiniteView;


@end












