//
//  RVPopupBoxViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVPopupBoxViewController.h"
#import "RXPopupBoxView.h"
@interface RVPopupBoxViewController ()

@end

@implementation RVPopupBoxViewController


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    RXPopupBoxView *pv = [[RXPopupBoxView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    pv.lineWidth = 10;
    pv.lineColor = [UIColor greenColor];
    pv.bgColor = [UIColor blueColor];
//    pv.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:pv];
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
