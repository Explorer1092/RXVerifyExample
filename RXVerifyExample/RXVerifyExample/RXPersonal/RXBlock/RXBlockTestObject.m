//
//  RXBlockTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockTestObject.h"
#import "RXBlockQSortBRObject.h"
#import "RXBlockArrayObject.h"

@implementation RXBlockTestObject
- (void)mainTest
{
    
//    [self _test_qsort_b_r];
    
    [self _test_block_array];
}

- (void)_test_for_mass
{
    __block int a = 0;
    for (int i = 0; i < 10000; i++) {
        void (^block)(void) = ^{
            a++;
            NSLog(@"%zd", a);
        };
        block();
    }
    
//    void (^block2)() = ^{
//        a++;
//        NSLog(@"%zd", a);
//    };
//    block2();
    
//    void (^block3)(int) = ^(int b){
////        return b + 4;
//        NSLog(@"111");
//    };
//    int d = block3(10 );
    
//    id (^block3)(void) = ^(void) {
////        return nil;
//        return [NSObject new];
//    };
//    block3();

}

- (void)_test_qsort_b_r
{
    RXBlockQSortBRObject *rxBlockQSortBRObject = [RXBlockQSortBRObject new];
    [rxBlockQSortBRObject test_qsort_b];
    
    [rxBlockQSortBRObject test_qsort_r];
}

- (void)_test_block_array
{
    RXBlockArrayObject *rxBlockArrayObject = [RXBlockArrayObject new];
    [rxBlockArrayObject test];
}



@end
