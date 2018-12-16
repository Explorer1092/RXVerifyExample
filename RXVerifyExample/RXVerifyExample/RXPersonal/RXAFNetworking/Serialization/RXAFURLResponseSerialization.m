//
//  RXAFURLResponseSerialization.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFURLResponseSerialization.h"
// 原来是static的
NSError * RXAFErrorWithUnderlyingError(NSError *error, NSError *underlyingError) {
    if (!error) {
        return underlyingError;
    }
    
    if (!underlyingError || error.userInfo[NSUnderlyingErrorKey]) {
        return error;
    }
    
    NSMutableDictionary *mutableUserInfo = [error.userInfo mutableCopy];
    mutableUserInfo[NSUnderlyingErrorKey] = underlyingError;
    
    return [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:mutableUserInfo];
}
