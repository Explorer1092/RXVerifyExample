//
//  RXAFNetworkingViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNetworkingViewController.h"
#import "RXRuntimeUtil.h"
#import "RXAFNTest1Object.h"
#import "RXAFNTest2Object.h"
#import "RXAFNTest3Object.h"
#import "RXAFNTestDependPropertyObject.h"
#import "RXAFNTestManager.h"
#import "RXAFNSerializationTestObject.h"
#import "RXAFNAutoreleasingTestObject.h"
#import "RXReadonlyProperty3Object.h"
#import "RXNSArrayTestObject.h"
#import "RXInitializeTestObject.h"

#import "RXMethodSwizzleTestObject.h"

#import "RXCharacterSetTestObject.h"
#import "RXCountryWeatherApiTestObject.h"

#import "RXObserveTestObject.h"
#import "RXClassMetaClassTestObject.h"

#import "RXBlockTestObject.h"

#import "RXLockTestObject.h"
#import "RXARCTestObject.h"
// 子线程中的通知问题
//https://www.jianshu.com/p/208568075b4f
@interface RXAFNetworkingViewController ()

@property (nonatomic, strong) RXAFNTestDependPropertyObject *dependPropertyObject;


@property (nonatomic, strong) RXAFNTestManager *afnTestManager;

@property (nonatomic, strong) RXAFNSerializationTestObject *afnSerializationTestObject;
@property (nonatomic, strong) RXAFNAutoreleasingTestObject *afnAutoreleasingTestObject;
@property (nonatomic, strong) RXReadonlyProperty3Object *rxReadonlyProperty3Object;
@property (nonatomic, strong) RXNSArrayTestObject *rxNSArrayTestObject;

@property (nonatomic, strong) RXInitializeTestObject *rxInitializeTestObject;

@property (nonatomic, strong) RXMethodSwizzleTestObject *rxMethodSwizzleTestObject;
@property (nonatomic, strong) RXCharacterSetTestObject *rxCharacterSetTestObject;

@property (nonatomic, strong) RXCountryWeatherApiTestObject *rxCountryWeatherApiTestObject;
@property (nonatomic, strong) RXObserveTestObject *rxObserveTestObject;
@property (nonatomic, strong) RXClassMetaClassTestObject *rxClassMetaClassTestObject;
@property (nonatomic, strong) RXBlockTestObject *rxBlockTestObject;
@property (nonatomic, strong) RXLockTestObject *rxLockTestObject;
@property (nonatomic, strong) RXARCTestObject *rxARCTestObject;


@property (nonatomic, copy) NSMutableArray *array;


@end

@implementation RXAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    void (^block)(void) = ^{
//        _array = [NSMutableArray new];
//    };
//    block();
    
    
    
//    NSMutableArray *tmp = [NSMutableArray arrayWithObjects:@"1", @"2", nil];
//    self.array = tmp;
//    [self.array removeObjectAtIndex:0];
//    NSLog(@"11");
    
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
    
//    [self.dependPropertyObject test_dependProperty_A1_B1];
    
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
//    [self.afnAutoreleasingTestObject test2];
//    [self.afnAutoreleasingTestObject test3];
//    [self.afnAutoreleasingTestObject test4];
//    [self.afnAutoreleasingTestObject test5];
//    [self.afnAutoreleasingTestObject test6];
//    [self.afnAutoreleasingTestObject test7];
    
    
//    void (^block2)(void) = ^() {
//        NSLog(@"block2 invoke");
//    };
//    Class cls = [block2 class];
//    NSString *str = NSStringFromClass(cls);
//    NSLog(@"str:%@", str);
    
    self.rxReadonlyProperty3Object = [RXReadonlyProperty3Object new];
//    [self.rxReadonlyProperty3Object printValue];
//    [self.rxReadonlyProperty3Object print2Value];
    
    self.rxNSArrayTestObject = [RXNSArrayTestObject new];
//    [self.rxNSArrayTestObject test];
    
    
    self.rxInitializeTestObject = [RXInitializeTestObject new];
//    [self.rxInitializeTestObject test_doNoting];
//    [self.rxInitializeTestObject test_empty];
//    [self.rxInitializeTestObject test_custom];
//    [self.rxInitializeTestObject test_empty_custom];
//    [self.rxInitializeTestObject test_custom_empty];
//    [self.rxInitializeTestObject test_custom_custom2];
//    [self.rxInitializeTestObject test_superCustom];
    
    self.rxMethodSwizzleTestObject = [RXMethodSwizzleTestObject new];
//    [self.rxMethodSwizzleTestObject test_roughly];
//    [self.rxMethodSwizzleTestObject test_roughly_after_parent];
    
//    [self.rxMethodSwizzleTestObject test_roughly_before_parent];
    
    
    self.rxCharacterSetTestObject = [RXCharacterSetTestObject new];
//    [self.rxCharacterSetTestObject test];
    
    self.rxCountryWeatherApiTestObject = [RXCountryWeatherApiTestObject new];
//    [self.rxCountryWeatherApiTestObject test];
    
//    self.rxObserveTestObject = [RXObserveTestObject new];
//    [self.rxObserveTestObject test_notSameObject];
//    [self.rxObserveTestObject test_remove_notExist];
//    [self.rxObserveTestObject test_remove_multiple];
//    [self.rxObserveTestObject test];
//    [self.rxObserveTestObject test_after_call_test];
    
//
//    [self addObserver:self forKeyPath:@"sss" options:NSKeyValueObservingOptionNew context:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:nil name:@"111" object:nil];
    
    
//    Class cls1 = [UIView class];
//    Class cls2 = [self.view class];
//
//    [RXRuntimeUtil printMethodListWithClass:cls1];
//    NSLog(@"-------");
//    [RXRuntimeUtil printMethodListWithClass:cls2];
//    NSLog(@"cls1:%@, cls2:%@", NSStringFromClass(cls1), NSStringFromClass(cls2));
    
    self.rxClassMetaClassTestObject = [RXClassMetaClassTestObject new];
//    [self.rxClassMetaClassTestObject mainTest];
    
    self.rxBlockTestObject = [RXBlockTestObject new];
    [self.rxBlockTestObject mainTest];
    
    self.rxLockTestObject = [RXLockTestObject new];
//    [self.rxLockTestObject mainTest];
    
    self.rxARCTestObject = [RXARCTestObject new];
//    [self.rxARCTestObject mainTest];
    
    
    
    
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
    
//    [[NSNotificationQueue defaultQueue] enqueueNotification:nil postingStyle:NSPostWhenIdle];
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
