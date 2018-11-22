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
#import "RXAFNTest4Object.h"
#import "RXAFNTest5Object.h"

@interface RXAFNetworkingViewController ()

@property (nonatomic, strong) RXAFNTest4Object *test4Object;
@property (nonatomic, strong) RXAFNTest5Object *test5Object;

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
    
//    [self test_dependProperty];
//    [self test_dependProperty2];
    
    [self test_dispatch_async];

    
    
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

- (void)test_dependProperty {
    self.test4Object = [RXAFNTest4Object new];
    [self.test4Object addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew context:nil];
//    [self.test4Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.a = 5;
    });
}

- (void)test_dependProperty2 {
    self.test5Object = [RXAFNTest5Object new];
//    [self.test5Object addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew context:nil];
    [self.test5Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test5Object.a = 5;
    });
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath:%@, change:%@", keyPath, change);
}


- (void)test_dispatch_async
{
    __block int a = 0;
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            int arc = arc4random() % 3;
            sleep(arc);
            a++;
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
