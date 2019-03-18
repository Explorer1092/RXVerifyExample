//
//  RXAVAudioTestManagerObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAVAudioTestManagerObject.h"
#import "RBDMuteSwitchObject.h"
static RXAVAudioTestManagerObject *_sharedInstance;
@interface RXAVAudioTestManagerObject()
@property (nonatomic, strong) RBDMuteSwitchObject *muteSwitchObject;


@end
@implementation RXAVAudioTestManagerObject
+ (instancetype)sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[[self class] alloc] init];
    }
    return _sharedInstance;
}
- (void)test {
    self.muteSwitchObject = [RBDMuteSwitchObject new];
    [self.muteSwitchObject test];
}
@end
