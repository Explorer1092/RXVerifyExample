//
//  RXVolumnTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVolumnTestManager.h"
@interface RXVolumnTestManager()

@end


@implementation RXVolumnTestManager



- (void)test {
    
    
    
    
    
    
}



+ (instancetype)sharedInstance
{
    
    static RXVolumnTestManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
