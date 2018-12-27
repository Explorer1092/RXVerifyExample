//
//  RXLoadInitializeTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/27.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXLoadInitializeTestObject.h"

#import "RXLoadInitialize2Object.h"
#import "RXLoadInitialize22Object.h"
#import "RXLoadInitialize222Object.h"
#import "RXLoadInitialize3Object.h"
@interface RXLoadInitializeTestObject()

@property (nonatomic, strong) RXLoadInitialize2Object *rxLoadInitialize2Object;
@property (nonatomic, strong) RXLoadInitialize22Object *rxLoadInitialize22Object;
@property (nonatomic, strong) RXLoadInitialize222Object *rxLoadInitialize222Object;
@property (nonatomic, strong) RXLoadInitialize3Object *rxLoadInitialize3Object;
@end
@implementation RXLoadInitializeTestObject

- (id)init
{
    if (self = [super init]) {
        
        
        
    }
    return self;
}

- (void)test2
{
    
    self.rxLoadInitialize2Object = [RXLoadInitialize2Object new];
    [self.rxLoadInitialize2Object print];
}

- (void)test2_22
{
    
    self.rxLoadInitialize2Object = [RXLoadInitialize2Object new];
    [self.rxLoadInitialize2Object print];
    
    self.rxLoadInitialize22Object = [RXLoadInitialize22Object new];
    [self.rxLoadInitialize22Object print];
}


- (void)test2_222
{
    self.rxLoadInitialize2Object = [RXLoadInitialize2Object new];
    [self.rxLoadInitialize2Object print];
    
    self.rxLoadInitialize222Object = [RXLoadInitialize222Object new];
    [self.rxLoadInitialize222Object print];
}

- (void)test3
{
    
    self.rxLoadInitialize3Object = [RXLoadInitialize3Object new];
    [self.rxLoadInitialize3Object print];
}

@end
