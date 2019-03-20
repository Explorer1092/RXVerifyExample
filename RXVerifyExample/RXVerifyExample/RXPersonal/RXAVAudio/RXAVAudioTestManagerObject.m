//
//  RXAVAudioTestManagerObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAVAudioTestManagerObject.h"
#import "RBDMuteSwitchObject.h"
#import "AudioToolbox/AudioToolbox.h"


// https://www.cnblogs.com/knrainy/articles/3435739.html
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
//    [self test_mute];
    
    [self test_isSilent];
}

- (void)test_mute {
    
    self.muteSwitchObject = [RBDMuteSwitchObject new];
    [self.muteSwitchObject test];
}

- (void)test_isSilent {
    NSLog(@"silent:%d", [self isSilentMode]);
}


// 以下方法不对
- (BOOL)isSilentMode {
    CFStringRef state;
    UInt32 propertySize = sizeof(CFStringRef);
    AudioSessionInitialize(NULL, NULL, NULL, NULL);
    AudioSessionGetProperty(kAudioSessionProperty_AudioRoute, &propertySize, &state);
    return CFStringGetLength(state) == 0;
}
@end
