//
//  RXAFNetworkingViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNetworkingViewController.h"
#import "RXAFNTest1Object.h"
#import "RXAFNTest2Object.h"

@interface RXAFNetworkingViewController ()

@end

@implementation RXAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[RXAFNTest1Object new] test];
    [[RXAFNTest2Object new] test];
    
    
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
