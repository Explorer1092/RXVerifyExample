//
//  RVButtonViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 16/1/3.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVButtonViewController.h"

@interface RVButtonViewController ()

@end

@implementation RVButtonViewController

- (void)buttonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    for (UIView *view in button.subviews) {
        NSLog(@"view:%@", view);
    }
}


- (UIButton *)buttonTest
{
    CGFloat width = RX_Window_Width;
    CGFloat buttonHeight = 44;
    CGFloat buttonX = 20;
    CGFloat buttonY = 0;
    CGFloat buttonWidth = width - buttonX * 2;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    button.layer.cornerRadius = 1;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    UIImage *image = [[UIColor redColor] rx_imageWithSize:CGSizeMake(24, 24)];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
//    CGFloat height = RX_Window_Height;
    
    CGFloat startY = 10;
    CGFloat yOffset = 10;
    UIButton *button0 = [self buttonTest];
    button0.top = startY + (yOffset + button0.height) * 0;
    
    
    UIButton *button1 = [self buttonTest];
    button1.top = startY + (yOffset + button0.height) * 1;
    
    
    UIButton *button2 = [self buttonTest];
    button2.top = startY + (yOffset + button0.height) * 2;
    
    
    UIButton *button3 = [self buttonTest];
    button3.top = startY + (yOffset + button0.height) * 3;
    
    
    UIButton *button4 = [self buttonTest];
    button4.top = startY + (yOffset + button0.height) * 4;

    
    UIButton *button5 = [self buttonTest];
    button5.top = startY + (yOffset + button0.height) * 5;

    
    UIButton *button6 = [self buttonTest];
    button6.top = startY + (yOffset + button0.height) * 6;

    
    UIButton *button7 = [self buttonTest];
    button7.top = startY + (yOffset + button0.height) * 7;

    
    [self.view addSubview:button0];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    [self.view addSubview:button6];
    [self.view addSubview:button7];


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
