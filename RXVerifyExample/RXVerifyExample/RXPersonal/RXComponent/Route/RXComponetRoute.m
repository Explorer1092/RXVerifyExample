//
//  RXComponetRoute.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXComponetRoute.h"

const NSString *kRXComponetRouteErrorRoute = @"com.kRXComponetRoute.error.route";
const NSString *kRXComponetRouteAsyncDataCompletionKey = @"com.kRXComponetRoute.async.data.completion.key";



@interface RXComponetRoute()

@property (nonatomic, strong) NSMutableDictionary *globalRoute;

@end

@implementation RXComponetRoute

+ (void)updateStrategy {
    
}

#pragma mark - register

+ (void)registerViewController:(NSString *)route block:(UIViewController *(^)(NSDictionary *))block {
    [self _register:route block:block];
}
+ (void)registerSyncData:(NSString *)route block:(NSDictionary *(^)(NSDictionary *))block {
    [self _register:route block:block];
}
+ (void)registerAsyncData:(NSString *)route block:(void(^)(NSDictionary *))block {
    [self _register:route block:block];
}


+ (void)_register:(NSString *)route block:(id)block {
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    [manger.globalRoute setObject:block forKey:route];
}
#pragma mark - route
+ (id)routeViewController:(NSString *)route params:(NSDictionary *)params {
    return [self _route:route params:params useError:YES];
}
+ (id)routeDataSync:(NSString *)route params:(NSDictionary *)params {
    return [self _route:route params:params useError:NO];
}
+ (void)routeDataAsync:(NSString *)route params:(NSDictionary *)params competion:(void(^)(NSDictionary *))competion {
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    void(^block)(NSDictionary *) = (void(^)(NSDictionary *))(manger.globalRoute[route]);
    if (block == nil) {
        if (competion != nil) {
            competion(nil);
        }
    } else {
        NSMutableDictionary *realParams = [NSMutableDictionary dictionaryWithDictionary:params];
        if (competion != nil) {
            realParams[kRXComponetRouteAsyncDataCompletionKey] = competion;
        }
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
