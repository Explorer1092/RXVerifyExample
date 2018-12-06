//
//  RXAFURLRequestSerialization.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/1.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>

#if TARGET_OS_IOS || TARGET_OS_TV
#import <UIKit/UIKit.h>
#elif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#endif

NS_ASSUME_NONNULL_BEGIN


// TODOAFN_M_3_K_1
/**
 Returns a percent-escaped string following RFC 3986 for a query string key or value.
 RFC 3986 states that the following characters are "reserved" characters.
 - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
 - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
 
 In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
 query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
 should be percent-escaped in the query string.
 
 @param string The string to be percent-escaped.
 
 @return The percent-escaped string.
 */
FOUNDATION_EXPORT NSString * RXAFPercentEscapedStringFromString(NSString *string);


// TODOAFN_M_3_K_2
/**
 A helper method to generate encoded url query parameters for appending to the end of a URL.
 
 @param parameters A dictionary of key/values to be encoded.
 
 @return A url encoded query string
 */
FOUNDATION_EXPORT NSString * RXAFQueryStringFromParameters(NSDictionary *parameters);


// 在.m文件中,临时放在.h中
FOUNDATION_EXPORT NSArray * RXAFQueryStringPairsFromDictionary(NSDictionary *dictionary);

FOUNDATION_EXPORT NSArray * RXAFQueryStringPairsFromKeyAndValue(NSString *key, id value);





@interface RXAFURLRequestSerialization : NSObject

@end

NS_ASSUME_NONNULL_END
