//
//  RXComponetRoute.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXComponetRoute.h"
#import "RXRouteRequest.h"
#import "RXRouteDefinition.h"
#import "RXRouteResponse.h"

const NSString *kRXComponetRouteErrorRoute = @"error://route";
const NSString *kRXComponetRouteAsyncDataCompletionKey = @"com.kRXComponetRoute.async.data.completion.key";



@interface RXComponetRoute()

@property (nonatomic, strong) NSMutableDictionary *globalRoute;

@end

@implementation RXComponetRoute

+ (void)updateStrategy {
//    NSString *strategy = @"asdk://AHomeVC?error";
    
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
    RXRouteDefinition *routeDefinition = [[RXRouteDefinition alloc] initWithRoute:route];
    RXRouteResponse * routeResponse = [[RXRouteResponse alloc] initWithRouteDefinition:routeDefinition block:block];
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    [manger.globalRoute setObject:routeResponse forKey:routeDefinition];
}
#pragma mark - route
+ (id)routeViewController:(NSString *)route params:(NSDictionary *)params {
    return [self _route:route params:params useError:YES];
}
+ (id)routeDataSync:(NSString *)route params:(NSDictionary *)params {
    return [self _route:route params:params useError:NO];
}
+ (void)routeDataAsync:(NSString *)route params:(NSDictionary *)params competion:(void(^)(NSDictionary *))competion {
    RXRouteRequest *request = [[RXRouteRequest alloc] initWithRoute:route];
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    RXRouteResponse *response = manger.globalRoute[request.routeDefinition];
    void(^block)(NSDictionary *) = (void(^)(NSDictionary *))(response.block);
    if (block == nil) {
        if (competion != nil) {
            competion(nil);
        }
    } else {
        NSMutableDictionary *realParams = [NSMutableDictionary dictionaryWithDictionary:params];
        [realParams addEntriesFromDictionary:request.urlParams];
        if (competion != nil) {
            realParams[kRXComponetRouteAsyncDataCompletionKey] = competion;
        }
        block(realParams);
    }
}


#pragma mark - Private
+ (id)_route:(NSString *)route params:(NSDictionary *)params useError:(BOOL)useError
{
    RXRouteRequest *request = [[RXRouteRequest alloc] initWithRoute:route];
    RXComponetRoute *manger = [RXComponetRoute sharedInstance];
    RXRouteResponse *response = manger.globalRoute[request.routeDefinition];
    id(^block)(NSDictionary *) = (id(^)(NSDictionary *))(response.block);
    if (block == nil && useError) {
        block = manger.globalRoute[kRXComponetRouteErrorRoute];
    }
    NSMutableDictionary *realParams = [NSMutableDictionary dictionaryWithDictionary:params];
    [realParams addEntriesFromDictionary:request.urlParams];
    return block != nil ? block(realParams) : nil;
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
