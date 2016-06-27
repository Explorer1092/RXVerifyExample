//
//  RVUtilityViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/6/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVUtilityViewController.h"

@interface RVUtilityViewController ()

@end

@implementation RVUtilityViewController

#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    self.view.backgroundColor = [UIColor redColor];
}
- (void)initializeAction
{
    [self test_LongPressGestureRecognize];
}



#pragma mark - UILongPressGestureRecognizer
- (void)test_LongPressGestureRecognize
{
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPressGR.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPressGR];
}
- (void)longPressAction:(id)sender
{
    UILongPressGestureRecognizer *lpgr = sender;
    switch (lpgr.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"UIGestureRecognizerStateBegan");
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"UIGestureRecognizerStateChanged");
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"UIGestureRecognizerStateEnded Or UIGestureRecognizerStateCancelled");
        }
            break;
        default:
            break;
    }
}


#pragma mark - UIKeyboard
- (void)test_UIKeyboardShowOrHide
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(uiKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(uiKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
    
    
    [nc addObserver:self selector:@selector(uiKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    [nc addObserver:self selector:@selector(uiKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
}
#pragma mark - Notification
- (void)uiKeyboardWillShowNotification:(id)sender
{
    NSNotification *notification = sender;
    NSDictionary *userInfo = notification.userInfo;
    CGSize size = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSLog(@"size:%@", NSStringFromCGSize(size));
}
- (void)uiKeyboardDidShowNotification:(id)sender
{
    
}
- (void)uiKeyboardWillHideNotification:(id)sender
{
    
}
- (void)uiKeyboardDidHideNotification:(id)sender
{
    
}












@end
