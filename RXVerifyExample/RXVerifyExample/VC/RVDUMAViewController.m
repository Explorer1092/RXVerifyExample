//
//  RVDUMAViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVDUMAViewController.h"
#import "RVDUMAView.h"


@interface RVDUMAViewController ()
@property (nonatomic, strong) RVDUMAView *rvDUMAView;
@end

@implementation RVDUMAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rvDUMAView = [RVDUMAView rxView];
    [self.view addSubview:self.rvDUMAView];
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
