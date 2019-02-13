//
//  RXLayoutView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXLayoutView.h"

@implementation RXLayoutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews
{
    printf("RXLayoutView layoutSubviews\n");
}

@end
