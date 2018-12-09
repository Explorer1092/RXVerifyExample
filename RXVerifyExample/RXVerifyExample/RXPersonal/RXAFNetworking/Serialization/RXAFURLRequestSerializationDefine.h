//
//  RXAFURLRequestSerializationDefine.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

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



// TODOAFN_M_3_K_7

#pragma mark -

///----------------
/// @name Constants
///----------------

/**
 ## Error Domains
 
 The following error domain is predefined.
 
 - `NSString * const AFURLRequestSerializationErrorDomain`
 
 ### Constants
 
 `AFURLRequestSerializationErrorDomain`
 AFURLRequestSerializer errors. Error codes for `AFURLRequestSerializationErrorDomain` correspond to codes in `NSURLErrorDomain`.
 */
FOUNDATION_EXPORT NSString * const RXAFURLRequestSerializationErrorDomain;

/**
 ## User info dictionary keys
 
 These keys may exist in the user info dictionary, in addition to those defined for NSError.
 
 - `NSString * const AFNetworkingOperationFailingURLRequestErrorKey`
 
 ### Constants
 
 `AFNetworkingOperationFailingURLRequestErrorKey`
 The corresponding value is an `NSURLRequest` containing the request of the operation associated with an error. This key is only present in the `AFURLRequestSerializationErrorDomain`.
 */
FOUNDATION_EXPORT NSString * const RXAFNetworkingOperationFailingURLRequestErrorKey;

/**
 ## Throttling Bandwidth for HTTP Request Input Streams
 
 @see -throttleBandwidthWithPacketSize:delay:
 
 ### Constants
 
 `kAFUploadStream3GSuggestedPacketSize`
 Maximum packet size, in number of bytes. Equal to 16kb.
 
 `kAFUploadStream3GSuggestedDelay`
 Duration of delay each time a packet is read. Equal to 0.2 seconds.
 */
FOUNDATION_EXPORT NSUInteger const kRXAFUploadStream3GSuggestedPacketSize;
FOUNDATION_EXPORT NSTimeInterval const kRXAFUploadStream3GSuggestedDelay;

