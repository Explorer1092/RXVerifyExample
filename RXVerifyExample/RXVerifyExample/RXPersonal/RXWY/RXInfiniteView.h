//
//  RXInfiniteView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
// 无限的一个scrollerView


typedef enum E_RX_InfiniteViewType {
    kE_RX_InfiniteViewType_Infinite     =       0,      // 无限的
    kE_RX_InfiniteViewType_Limit        =       1,      // 有限的
}E_RX_InfiniteViewType;



@protocol RXInfiniteViewDataSource;





@interface RXInfiniteView : UIView

@property (nonatomic, assign) E_RX_InfiniteViewType e_RX_InfiniteViewType;
@property (nonatomic, weak) id<RXInfiniteViewDataSource> dataSource;


- (id)initWithFrame:(CGRect)frame type:(E_RX_InfiniteViewType)type;



@end



@protocol RXInfiniteViewDataSource <NSObject>

- (NSInteger)numberOfPageInInfiniteView:(RXInfiniteView *)infiniteView;

- (UIView *)infiniteView:(RXInfiniteView *)infiniteView viewForAtIndex:(NSInteger)index;

@end












