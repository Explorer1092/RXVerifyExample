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
#import "RXAFNTest3Object.h"
#import "RXAFNTestDependPropertyObject.h"
#import "RXAFNTestManager.h"
#import "RXAFNSerializationTestObject.h"
#import "RXAFNAutoreleasingTestObject.h"

@interface RXAFNetworkingViewController ()

@property (nonatomic, strong) RXAFNTestDependPropertyObject *dependPropertyObject;


@property (nonatomic, strong) RXAFNTestManager *afnTestManager;

@property (nonatomic, strong) RXAFNSerializationTestObject *afnSerializationTestObject;
@property (nonatomic, strong) RXAFNAutoreleasingTestObject *afnAutoreleasingTestObject;


@end

@implementation RXAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[RXAFNTest1Object new] test];
//    [[RXAFNTest2Object new] test];
    
//    [self test_mainQueue_dispathAsync_MainQueue];
    
//    [self test_mainQueue_dispathAsync_GlobalQueue];
    
//    [self test_classProperty];
    
    
//    [self test_dispatch_async];
    
    self.afnSerializationTestObject = [RXAFNSerializationTestObject new];
    
//    [self.afnSerializationTestObject test1];
    
//    [self.afnSerializationTestObject test2];
    
    self.dependPropertyObject = [RXAFNTestDependPropertyObject new];
//    [self.dependPropertyObject test_dependProperty_A_B];
    
//    [self.dependPropertyObject test_dependProperty_C_D];
    
//    [self.dependPropertyObject test_dependProperty_C1_C2_C3_D1];
    
//    [self.dependPropertyObject test_dependProperty_E_F];
    
//    [self.dependPropertyObject test_dependProperty_G_H];
    
//    [self.dependPropertyObject test_dependProperty_G1_H1_H2_H3];
    
//    [self.dependPropertyObject test_dependProperty_I_J_1];
    
//    [self.dependPropertyObject test_dependProperty_I_J_2];
    
//    [self.dependPropertyObject test_dependProperty_L1_L2_M1_M2];
    
//    [self.dependPropertyObject test_dependProperty_P1_P2_Q1_Q2];

//    [self.dependPropertyObject test_dependProperty_R1_R2_S1_S2];
    
    
    self.afnTestManager = [RXAFNTestManager new];
//    [self.afnTestManager test];
    
    self.afnAutoreleasingTestObject = [RXAFNAutoreleasingTestObject new];
//    [self.afnAutoreleasingTestObject test1];
    [self.afnAutoreleasingTestObject test3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test_mainQueue_dispathAsync_MainQueue {
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
- (void)test_mainQueue_dispathAsync_GlobalQueue {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
- (void)test_classProperty {
    [RXAFNTest3Object setValue:4];
    NSLog(@"%zd", [RXAFNTest3Object value]);
}





- (void)test_dispatch_async
{
    // 这里必须加上__block
    __block int a = 0;
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            int random = arc4random() % 3;
            sleep(random);
            a++;
            // a和i不是一一对应的,因为是多线程
            NSLog(@"a:%zd in block, i:%zd", a, i);
        });
    }
    NSLog(@"a:%zd", a);
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
