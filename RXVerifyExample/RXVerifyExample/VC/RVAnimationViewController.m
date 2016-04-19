//
//  RVAnimationViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/4/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVAnimationViewController.h"
#import "RVPushPopAnimation.h"
@interface RVAnimationViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIView *greenView;


@property (nonatomic, strong) UIButton *greenButton;
@property (nonatomic, strong) UIButton *blueButton;

@property (nonatomic, strong) RVPushPopAnimation *rvPushPopAnimation;

@end

@implementation RVAnimationViewController
#pragma mark - UINavigationControllerDelegate
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
//    return nil;
    if (operation == UINavigationControllerOperationPush) {
        NSString *fromVCString = NSStringFromClass([fromVC class]);
        NSString *toVCString = NSStringFromClass([toVC class]);
        if ([fromVCString isEqualToString:@"RVAnimationViewController"] && [toVCString isEqualToString:@"RVAnimation2ViewController"]) {
            self.rvPushPopAnimation.ncOperation = UINavigationControllerOperationPush;
            return self.rvPushPopAnimation;
        }
    }
    
    if (operation == UINavigationControllerOperationPop) {
        NSString *fromVCString = NSStringFromClass([fromVC class]);
        NSString *toVCString = NSStringFromClass([toVC class]);
        if ([fromVCString isEqualToString:@"RVAnimation2ViewController"] && [toVCString isEqualToString:@"RVAnimationViewController"]) {
            self.rvPushPopAnimation.ncOperation = UINavigationControllerOperationPop;
            return self.rvPushPopAnimation;
        }
    }
    
    return nil;
}

#pragma mark - Action
- (void)greenButtonTouchUpInside:(id)sender
{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        if (self.greenView.width == RX_Window_Width) {
            self.greenView.size = CGSizeMake(0, 0);
            
            self.greenView.center = self.greenButton.center;
            CGRect bounds = self.greenButton.bounds;
            bounds.size.width = 0;
            bounds.size.height = 0;
            self.greenView.bounds = bounds;

        } else {
        
            self.greenView.frame = CGRectMake(0, 0, RX_Window_Width, RX_Window_Height - 64);
        }
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)blueButtonTouchUpInside:(id)sender
{
    
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = @"cube";
//    transition.type = @"moveIn";
//    transition.subtype = kCATransitionFromRight;
//    transition.delegate = self;
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    
//    self.navigationController.transitioningDelegate = self;
    self.navigationController.delegate = self;
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://RVAnimation2ViewController" query:nil animate:YES];
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height - 64;
    

    
    CGFloat buttonWidth = 75;
    CGFloat buttonOffset = 25;
    CGFloat buttonX = width - buttonWidth - buttonOffset;
    CGFloat blueButtonY = height - buttonWidth - buttonOffset;
    CGFloat greenButtonY = blueButtonY - buttonWidth - buttonOffset;
    
    self.greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.greenButton.frame = CGRectMake(buttonX, greenButtonY, buttonWidth, buttonWidth);
    self.greenButton.backgroundColor = [UIColor clearColor];
    [self.greenButton setTitle:@"绿色" forState:UIControlStateNormal];
    [self.greenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.greenButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.greenButton.layer.borderWidth = 1.0f;
    self.greenButton.titleLabel.shadowColor = [UIColor whiteColor];
    self.greenButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    [self.greenButton rx_makeRound];
    [self.greenButton addTarget:self action:@selector(greenButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    self.blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blueButton.frame = CGRectMake(buttonX, blueButtonY, buttonWidth, buttonWidth);
    self.blueButton.backgroundColor = [UIColor clearColor];
    [self.blueButton setTitle:@"蓝色" forState:UIControlStateNormal];
    [self.blueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.blueButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.blueButton.layer.borderWidth = 1.0f;
    self.blueButton.titleLabel.shadowColor = [UIColor whiteColor];
    self.blueButton.titleLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    [self.blueButton rx_makeRound];
    [self.blueButton addTarget:self action:@selector(blueButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.blueButton addTarget:self action:@selector(blueButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.greenButton];
    [self.view addSubview:self.blueButton];
    
    
    self.greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view insertSubview:self.greenView atIndex:0];
    self.greenView.center = self.greenButton.center;
    
    self.view.backgroundColor = [UIColor redColor];
    
    CGPoint center = [self.view convertPoint:self.blueButton.center fromView:self.blueButton];

    
    self.rvPushPopAnimation = [[RVPushPopAnimation alloc] initWithCircleCenter:center circleRadius:self.blueButton.width / 2.0f];
    
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
