//
//  RXTestManagerViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTestManagerViewController.h"
#import "RXSelfRequestManager.h"
#import "RXClassExtensionManager.h"
@interface RXTestManagerViewController ()

@end

@implementation RXTestManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[RXSelfRequestManager sharedInstance] test];
    
    [[RXClassExtensionManager sharedInstance] test];
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
