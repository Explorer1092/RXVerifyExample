//
//  RVAnimationViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/4/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVAnimationViewController.h"

@interface RVAnimationViewController ()

@property (nonatomic, strong) UIView *greenView;


@end

@implementation RVAnimationViewController


#pragma mark - Action
- (IBAction)greenButtonTouchUpInside:(id)sender
{
    [self.view addSubview:self.greenView];
}

- (IBAction)blueButtonTouchUpInside:(id)sender
{
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVAnimation2ViewController" query:nil animate:YES];
}

#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    self.greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RX_Window_Width, RX_Window_Height - 64)];
    self.greenView.backgroundColor = [UIColor greenColor];
    

    
    
    self.view.backgroundColor = [UIColor redColor];
    
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
