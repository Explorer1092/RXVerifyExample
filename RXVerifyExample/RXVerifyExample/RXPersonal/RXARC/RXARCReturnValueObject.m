//
//  RXARCReturnValueObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCReturnValueObject.h"
#import "RXARCTmpObject.h"
#import "RXMRCUtil.h"
#import "RXExternUtil.h"
@interface RXARCReturnValueObject()
@property (nonatomic, strong) id recordObject;
@end
@implementation RXARCReturnValueObject

- (id)_foo_return_value
{
    RXARCTmpObject *tmp = [[RXARCTmpObject alloc] init];
    id object = [NSString stringWithFormat:@"%@", tmp];
    NSLog(@"count after product:%zd", [RXMRCUtil objectRetainCount:object]);
    
    self.recordObject = object;
    NSLog(@"count after =:%zd", [RXMRCUtil objectRetainCount:object]);
    return object;
}
- (void)_test_return_value
{
    NSLog(@"count before call method:%zd", [RXMRCUtil objectRetainCount:self.recordObject]);
    id object = [self _foo_return_value];
    
    NSLog(@"object: %p", object);
    _objc_autoreleasePoolPrint();
    NSLog(@"count after call method:%zd", [RXMRCUtil objectRetainCount:object]);
    //    [RXMRCUtil objectRelease:object];
    
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"count after 3 seconds:%zd", [RXMRCUtil objectRetainCount:weakSelf.recordObject]);
    });
}

- (void)test
{
    [self _test_return_value];
}
@end
