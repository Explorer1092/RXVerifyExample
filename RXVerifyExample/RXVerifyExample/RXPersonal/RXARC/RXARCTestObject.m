//
//  RXARCTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCTestObject.h"
#import "RXARCCallObject.h"


@interface RXARCTestObject()
@property (nonatomic, strong) RXARCCallObject *rxARCCallObject;
@end

@implementation RXARCTestObject

- (void)mainTest 
{
//#if __has_attribute(objc_externally_retained)
//    // Use externally retained...
//    NSLog(@"1234");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(objc_method_family)
//    // Use externally retained...
//    NSLog(@"121222234");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(ns_returns_retained)
//    // Use externally retained...
//    NSLog(@"4333434");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(ns_returns_retained1)
//    // Use externally retained...
//    NSLog(@"4333434");
//#else
//    NSLog(@"1234");
//#endif
//    
////    __weak typeof(self) weakSelf = nil;
////
////    weakSelf = self;
////
////    weakSelf = [RXARCTestObject new];
//    
//    
//#if __has_feature(arc_cf_code_audited)
//    NSLog(@"arc_cf_code_audited");
//#else
//    NSLog(@"not arc_cf_code_audited");
//    
//# endif
//    
//    
//    //条件满足ARC
//#if __has_feature(objc_arc)
//    //    否则执行MAC
//    NSLog(@"ARC");
//#else
//    NSLog(@"MRC");
//    
//# endif

    
    
    
    self.rxARCCallObject = [RXARCCallObject new];
    [self.rxARCCallObject test];
//    [self.rxARCCallObject test2];
}
@end
