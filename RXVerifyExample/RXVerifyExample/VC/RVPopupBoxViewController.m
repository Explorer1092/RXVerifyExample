//
//  RVPopupBoxViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVPopupBoxViewController.h"
//#import "RXPopupBoxView.h"

#import "RXPopupView.h"
#import "RXPopView.h"
@interface RVPopupBoxViewController ()

@end

@implementation RVPopupBoxViewController


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    CGFloat borderWidth = 0.5;
    CGFloat cornerRadius = 10;
    
    
//    RXPopupBoxView *pv = [[RXPopupBoxView alloc] initWithFrame:CGRectMake(30, 0, 100, 150)];
//    pv.borderWidth = borderWidth;
//    pv.borderColor = [UIColor grayColor];
////    pv.offset = 10;
//    pv.trianglePoint = CGPointMake(10, 20);
//    pv.backgroundColor = [UIColor redColor];
//    pv.backgroundView.backgroundColor = [UIColor greenColor];
    
    RXPopView *pv = [[RXPopView alloc] initWithFrame:CGRectMake(30, 0, 100, 150)];
    pv.borderWidth = borderWidth;
    pv.borderColor = [UIColor grayColor];
    pv.trianglePoint = CGPointMake(4, 7);
    pv.cornerRadius = 5;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_TopCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_LeftCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_BottomCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_RightCenter;
    
    
//
//
    
    pv.topTrianglePoint = CGPointMake(5, 10);
    pv.leftTrianglePoint = CGPointMake(10, 5);
    pv.bottomTrianglePoint = CGPointMake(5, 10);
    pv.rightTrianglePoint = CGPointMake(10, 5);
    pv.edgeInsets = UIEdgeInsetsMake(50, 75, 50, 75);
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Top | kE_RXPopViewStyle_Left;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Right | kE_RXPopViewStyle_Bottom;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Right | kE_RXPopViewStyle_Bottom | kE_RXPopViewStyle_Top | kE_RXPopViewStyle_Left;
    
    

    
//    [pv refreshView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 150 + 20, 100, 150)];
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = cornerRadius;
    
    
    
    
//    RXPopupBoxView *pv2 = [[RXPopupBoxView alloc] initWithFrame:CGRectMake(150, 100, 100, 150)];
//    pv2.lineWidth = 1;
//    pv2.lineColor = [UIColor grayColor];
//    pv2.bgColor = [UIColor clearColor];
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 300, 100, 150)];
//    view2.layer.borderWidth = 1;
//    view2.layer.borderColor = [UIColor grayColor].CGColor;
//    view2.backgroundColor = [UIColor clearColor];
//    view2.layer.cornerRadius = 10;
    
    
    [self.view addSubview:pv];
//    [self.view addSubview:pv2];
    [self.view addSubview:view];
//    [self.view addSubview:view2];
}
- (void)initializeAction
{
    
}


#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
