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

- (IBAction)rvRectTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVRectViewController" query:nil animate:YES];
}
- (IBAction)rvTransformTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVTransformViewController" query:nil animate:YES];
}
- (IBAction)rvWYTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVWYViewController" query:nil animate:YES];
}
- (IBAction)rvPopupBoxViewTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVPopupBoxViewController" query:nil animate:YES];
}
- (IBAction)rvButtonTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVButtonViewController" query:nil animate:YES];
}

- (IBAction)rvUPPayTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVUPPayViewController" query:nil animate:YES];
}
- (IBAction)rvCGDTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVGCDViewController" query:nil animate:YES];
}
- (IBAction)rvAFNetworkingTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVAFNetworkingViewController" query:nil animate:YES];
}
- (IBAction)rvAnimationTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVAnimationViewController" query:nil animate:YES];
}

- (IBAction)rvDebugTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVDebugViewController" query:nil animate:YES];
}

- (IBAction)rvStrongWeakSelfTouchUpInside:(id)sender {
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVStrongWeakSelfViewController" query:nil animate:YES];
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
    [self performSelector:@selector(rvAFNetworkingTouchUpInside:) withObject:nil afterDelay:1];
    
    
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



/*
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 
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
 
 
 
 */

@end
