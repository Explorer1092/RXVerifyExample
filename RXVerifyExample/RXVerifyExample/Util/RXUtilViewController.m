//
//  RXUtilViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/19.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXUtilViewController.h"
#import "RXRuntimeUtil.h"
#import "RXRuntime1Object.h"
@interface RXUtilViewController ()

@end

@implementation RXUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test_runtimeUtil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test_runtimeUtil {
    [RXRuntimeUtil printProperty:[RXRuntime1Object new]];
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
