//
//  MainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController


- (IBAction)rvMenuTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVMenuViewController" query:nil animate:YES];
}


- (IBAction)rvRefreshTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVRefreshViewController" query:nil animate:YES];
}


- (IBAction)rvScrollTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVScrollViewController" query:nil animate:YES];
}




#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
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
