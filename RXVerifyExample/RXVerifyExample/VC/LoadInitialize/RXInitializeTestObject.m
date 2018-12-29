//
//  RXInitializeTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/27.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXInitializeTestObject.h"

#import "RXInitializeCustomObject.h"
#import "RXInitializeEmptyObject.h"
#import "RXInitializeCustom2Object.h"
#import "RXInitializeSuperCustomObject.h"
@interface RXInitializeTestObject()

@property (nonatomic, strong) RXInitializeCustomObject *rxLoadInitialize2Object;
@property (nonatomic, strong) RXInitializeEmptyObject *rxLoadInitialize22Object;
@property (nonatomic, strong) RXInitializeCustom2Object *rxLoadInitialize222Object;
@property (nonatomic, strong) RXInitializeSuperCustomObject *rxLoadInitialize3Object;
@end
@implementation RXInitializeTestObject

- (id)init
{
    if (self = [super init]) {
        
        
        
    }
    return self;
}

- (void)test2
{
    
    self.rxLoadInitialize2Object = [RXInitializeCustomObject new];
    [self.rxLoadInitialize2Object print];
}

- (void)test2_22
{
    
    self.rxLoadInitialize2Object = [RXInitializeCustomObject new];
    [self.rxLoadInitialize2Object print];
    
    self.rxLoadInitialize22Object = [RXInitializeEmptyObject new];
    [self.rxLoadInitialize22Object print];
}


- (void)test2_222
{
    self.rxLoadInitialize2Object = [RXInitializeCustomObject new];
    [self.rxLoadInitialize2Object print];
    
    self.rxLoadInitialize222Object = [RXInitializeCustom2Object new];
    [self.rxLoadInitialize222Object print];
}

- (void)test3
{
    
    self.rxLoadInitialize3Object = [RXInitializeSuperCustomObject new];
    [self.rxLoadInitialize3Object print];
}

@end
