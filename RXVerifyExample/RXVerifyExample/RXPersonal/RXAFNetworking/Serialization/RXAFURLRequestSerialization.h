//
//  RXAFURLRequestSerialization.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/1.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import "RXAFURLRequestSerializationProtocol.h"
#import "RXAFURLRequestSerializationDefine.h"
#if TARGET_OS_IOS || TARGET_OS_TV
#import <UIKit/UIKit.h>
#elif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#endif

NS_ASSUME_NONNULL_BEGIN
// TODOAFN_M_3_K_3
/**
 The `AFURLRequestSerialization` protocol is adopted by an object that encodes parameters for a specified HTTP requests. Request serializers may encode parameters as query strings, HTTP bodies, setting the appropriate HTTP header fields as necessary.
 
 For example, a JSON request serializer may set the HTTP body of the request to a JSON representation, and set the `Content-Type` HTTP header field value to `application/json`.
 */
@protocol RXAFURLRequestSerialization <NSObject, NSSecureCoding, NSCopying>

/**
 Returns a request with the specified parameters encoded into a copy of the original request.
 
 @param request The original request.
 @param parameters The parameters to be encoded.
 @param error The error that occurred while attempting to encode the request parameters.
 
 @return A serialized request.
 */
- (nullable NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                                        withParameters:(nullable id)parameters
                                                 error:(NSError * _Nullable __autoreleasing *)error NS_SWIFT_NOTHROW;

@end




NS_ASSUME_NONNULL_END
