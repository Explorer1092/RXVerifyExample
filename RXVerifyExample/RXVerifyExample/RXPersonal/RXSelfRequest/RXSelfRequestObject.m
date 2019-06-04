//
//  RXSelfRequestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSelfRequestObject.h"

@implementation RXSelfRequestObject
- (void)start {
    [self.delegate requesetFinished:self];
    if (self.completionBlock) {
        self.completionBlock(self);
        self.completionBlock = nil;
    }
}
@end
