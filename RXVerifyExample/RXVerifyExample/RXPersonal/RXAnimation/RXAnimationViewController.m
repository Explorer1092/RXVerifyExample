//
//  RXAnimationViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAnimationViewController.h"
#import "RXAnimationTestObject.h"
@interface RXAnimationViewController ()

@property (nonatomic, strong) UIView *animationView;

@end

@implementation RXAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationView];
    
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)test {
    RXAnimationTestObject *tmp = [RXAnimationTestObject new];
    [tmp testWithView:self.animationView];
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
