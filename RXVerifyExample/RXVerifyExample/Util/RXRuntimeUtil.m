//
//  RXRuntimeUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/19.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRuntimeUtil.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation RXRuntimeUtil

+ (void)printProperty:(id)value {
    NSMutableArray *array = [NSMutableArray new];
    [array addObject:@""];
    [array addObject:@"property list:"];
    [array addObject:@"propertyName | propertyAttributes"];
    Class cls = [value class];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        const char *propertAttributs = property_getAttributes(property);
        NSString *tmp = [NSString stringWithFormat:@"%s, %s", propertyName, propertAttributs];
        [array addObject:tmp];
    }
    NSLog(@"%@", [array componentsJoinedByString:@"\n"]);
    
    
    
    NSLog(@"method");
    Method *methodList = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method-->%@", NSStringFromSelector(method_getName(method)));
    }
    
    

    NSLog(@"ivar");
    Ivar *ivarList = class_copyIvarList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSLog(@"ivar-->%@", [NSString stringWithUTF8String:ivarName]);
        
    }
    
    NSLog(@"protocol");
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        NSLog(@"protocol-->%@", [NSString stringWithUTF8String:protocolName]);
        
    }
}

@end
