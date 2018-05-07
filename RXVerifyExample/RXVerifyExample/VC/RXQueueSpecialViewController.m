//
//  RXQueueSpecialViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXQueueSpecialViewController.h"


static const void * const abc = &abc;

@interface RXQueueSpecialViewController ()

@end

@implementation RXQueueSpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self inSameQueue];
//    [self testkkk];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)isCurQueueEqualQueue:(dispatch_queue_t)queue {
    NSString *specificKey = @"com.specific.specificKey";
    NSString *specificValue = @"com.specific.sepcificValue";
    dispatch_queue_set_specific(queue, &specificKey, (__bridge void *)specificValue, NULL);
    NSString *retrievedValue = (__bridge NSString *)dispatch_get_specific(&specificKey);
    return [retrievedValue isEqualToString:specificValue];
}
- (void)inSameQueue
{
    __weak __typeof(self) weakSelf = self;
    printf("\n================\n");
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);
    
    printf("queue1:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
    
    dispatch_sync(queueA, ^{
        
        printf("queue2:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
        
        dispatch_block_t block = ^{
            printf("queue4:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
            
        };
        if ([weakSelf isCurQueueEqualQueue:queueA]) {
            block();
        }
    });
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
