//
//  RXComponetRoute.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXComponetRoute.h"

const NSString *kRXComponetRouteErrorRoute = @"com.kRXComponetRoute.error.route";
const NSString *kRXComponetRouteAsyncData = @"com.kRXComponetRoute.async.data";



@interface RXComponetRoute()

@property (nonatomic, strong) NSMutableDictionary *globalRoute;

@end

@implementation RXComponetRoute

+ (void)registerWithRoute:(NSString *)route block:(id(^)(NSDictionary *))block {
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    [manger.globalRoute setObject:block forKey:route];
}

+ (id)routeViewController:(NSString *)route params:(NSDictionary *)params {
    return [self _route:route params:params useError:YES];
}


+ (id)routeDataSync:(NSString *)route params:(NSDictionary *)params
{
    return [self _route:route params:params useError:NO];
}

+ (void)routeDataAsync:(NSString *)route params:(NSDictionary *)params competion:(void(^)(NSDictionary *))competion
{
    
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    id(^block)(NSDictionary *) = (id(^)(NSDictionary *))(manger.globalRoute[route]);
    if (block == nil) {
        if (competion != nil) {
            competion(nil);
        }
    } else {
        NSMutableDictionary *realParams = [NSMutableDictionary dictionaryWithDictionary:params];
        if (competion != nil) {
            realParams[kRXComponetRouteAsyncData] = competion;
        }
        // 因为这里是异步的,不是同步的,所以这个返回值没有用
        block(realParams);
    }
}


#pragma mark - Private
+ (id)_route:(NSString *)route params:(NSDictionary *)params useError:(BOOL)useError
{
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    id(^block)(NSDictionary *) = (id(^)(NSDictionary *))(manger.globalRoute[route]);
    if (block == nil && useError) {
        block = manger.globalRoute[kRXComponetRouteErrorRoute];
    }
    return block != nil ? block(params) : nil;
}





#pragma mark - Singleton Model
+ (instancetype)sharedInstance
{
    static RXComponetRoute *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        self.globalRoute = [NSMutableDictionary new];
    }
    return self;
}
@end
