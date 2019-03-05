//
//  RXRouteDefinition.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRouteDefinition.h"

@implementation RXRouteDefinition
- (id)initWithRoute:(NSString *)route {
    if (self = [super init]) {
        NSString *uft8String = [route stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:uft8String];
        self.scheme = url.scheme;
        self.host = url.host;
        self.redirect = NO;
    }
    return self;
}

- (BOOL)valid {
    return self.scheme.length > 0 && self.host.length > 0;
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[RXRouteDefinition class]]) {
        return NO;
    }
    RXRouteDefinition *tmp = (RXRouteDefinition *)object;
    return [self.scheme isEqual:tmp.scheme] && [self.host isEqual:tmp.host] && (self.redirect == tmp.redirect);
}
- (NSUInteger)hash {
    return [self.scheme hash] / 2 + [self.host hash] / 2;
}

+ (id)invalidDefinition {
    RXRouteDefinition *result = [RXRouteDefinition new];
    result.scheme = @"";
    result.host = @"";
    result.redirect = NO;
    return result;
}
@end
