//
//  RXRuntimeFishHookUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRuntimeFishHookUtil.h"
#import "fishhook.h"

id (*origin_objc_autorelease)(id);
void (*origin_objc_autoreleasePoolPop)(void *);
void *(*origin_objc_autoreleasePoolPush)(void);
id (*origin_objc_autoreleaseReturnValue)(id);
void (*origin_objc_copyWeak)(id *, id *);
void (*origin_objc_destroyWeak)(id *);
id (*origin_objc_initWeak)(id *, id);
id (*origin_objc_loadWeak)(id *);
id (*origin_objc_loadWeakRetained)(id *);
void (*origin_objc_moveWeak)(id *, id *);
void (*origin_objc_release)(id);
id (*origin_objc_retain)(id);
id (*origin_objc_retainAutorelease)(id);
id (*origin_objc_retainAutoreleaseReturnValue)(id);
id (*origin_objc_retainAutoreleasedReturnValue)(id);
id (*origin_objc_retainBlock)(id);
void (*origin_objc_storeStrong)(id *, id);
id (*origin_objc_storeWeak)(id *, id);

id my_objc_autorelease(id value) {
    printf("my_objc_autorelease\n");
    return origin_objc_autorelease(value);
}
void my_objc_autoreleasePoolPop(void *pool) {
    printf("my_objc_autoreleasePoolPop\n");
    origin_objc_autoreleasePoolPop(pool);
}
void *my_objc_autoreleasePoolPush(void) {
    printf("my_objc_autoreleasePoolPush\n");
    return origin_objc_autoreleasePoolPush();
}
id my_objc_autoreleaseReturnValue(id value) {
    printf("my_objc_autoreleaseReturnValue\n");
    return origin_objc_autoreleaseReturnValue(value);
}
void my_objc_copyWeak(id *dest, id *src) {
    printf("my_objc_copyWeak\n");
    origin_objc_copyWeak(dest, src);
}
void my_objc_destroyWeak(id *object) {
    printf("my_objc_destroyWeak\n");
    origin_objc_destroyWeak(object);
}
id my_objc_initWeak(id *object, id value) {
    printf("my_objc_initWeak\n");
    return origin_objc_initWeak(object, value);
}
id my_objc_loadWeak(id *object) {
    printf("my_objc_loadWeak\n");
    return origin_objc_loadWeak(object);
}
id my_objc_loadWeakRetained(id *object) {
    printf("my_objc_loadWeakRetained\n");
    return origin_objc_loadWeakRetained(object);
}
void my_objc_moveWeak(id *dest, id *src) {
    printf("my_objc_moveWeak\n");
    origin_objc_moveWeak(dest, src);
}
void my_objc_release(id value) {
    printf("my_objc_release\n");
    origin_objc_release(value);
}
id my_objc_retain(id value) {
    printf("my_objc_retain\n");
    return origin_objc_retain(value);
}
id my_objc_retainAutorelease(id value) {
    printf("my_objc_retainAutorelease\n");
    return origin_objc_retainAutorelease(value);
}
id my_objc_retainAutoreleaseReturnValue(id value) {
    printf("my_objc_retainAutoreleaseReturnValue\n");
    return origin_objc_retainAutoreleaseReturnValue(value);
}
id my_objc_retainAutoreleasedReturnValue(id value) {
    printf("my_objc_retainAutoreleasedReturnValue\n");
    return origin_objc_retainAutoreleasedReturnValue(value);
}
id my_objc_retainBlock(id value) {
    printf("my_objc_retainBlock\n");
    return origin_objc_retainBlock(value);
}
void my_objc_storeStrong(id *object, id value) {
    printf("my_objc_storeStrong\n");
    origin_objc_storeStrong(object, value);
}
id my_objc_storeWeak(id *object, id value) {
    printf("my_objc_storeWeak\n");
    return origin_objc_storeWeak(object, value);
}

@implementation RXRuntimeFishHookUtil

//id my_objc_autorelease(id value);
//void my_objc_autoreleasePoolPop(void *pool);
//void *my_objc_autoreleasePoolPush(void);
//id my_objc_autoreleaseReturnValue(id value);
//void my_objc_copyWeak(id *dest, id *src);
//void my_objc_destroyWeak(id *object);
//id my_objc_initWeak(id *object, id value);
//id my_objc_loadWeak(id *object);
//id my_objc_loadWeakRetained(id *object);
//void my_objc_moveWeak(id *dest, id *src);
//void my_objc_release(id value);
//id my_objc_retain(id value);
//id my_objc_retainAutorelease(id value);
//id my_objc_retainAutoreleaseReturnValue(id value);
//id my_objc_retainAutoreleasedReturnValue(id value);
//id my_objc_retainBlock(id value);
//void my_objc_storeStrong(id *object, id value);
//id my_objc_storeWeak(id *object, id value);

+ (void)hook
{
    struct rebinding binds[1];
    
//    binds[0] = (struct rebinding){"objc_autorelease", my_objc_autorelease, (void*)&origin_objc_autorelease};
//    binds[1] = (struct rebinding){"objc_autoreleasePoolPop", my_objc_autoreleasePoolPop, (void*)&origin_objc_autoreleasePoolPop};
//    binds[2] = (struct rebinding){"objc_autoreleasePoolPush", my_objc_autoreleasePoolPush, (void*)&origin_objc_autoreleasePoolPush};
//    binds[3] = (struct rebinding){"objc_autoreleaseReturnValue", my_objc_autoreleaseReturnValue, (void*)&origin_objc_autoreleaseReturnValue};
//    binds[4] = (struct rebinding){"objc_copyWeak", my_objc_copyWeak, (void*)&origin_objc_copyWeak};
//    binds[5] = (struct rebinding){"objc_destroyWeak", my_objc_destroyWeak, (void*)&origin_objc_destroyWeak};
//    binds[6] = (struct rebinding){"objc_initWeak", my_objc_initWeak, (void*)&origin_objc_initWeak};
//    binds[7] = (struct rebinding){"objc_loadWeak", my_objc_loadWeak, (void*)&origin_objc_loadWeak};
//    binds[8] = (struct rebinding){"objc_loadWeakRetained", my_objc_loadWeakRetained, (void*)&origin_objc_loadWeakRetained};
//    binds[9] = (struct rebinding){"objc_moveWeak", my_objc_moveWeak, (void*)&origin_objc_moveWeak};
//    binds[10] = (struct rebinding){"objc_release", my_objc_release, (void*)&origin_objc_release};
//    binds[11] = (struct rebinding){"objc_retain", my_objc_retain, (void*)&origin_objc_retain};
//    binds[12] = (struct rebinding){"objc_retainAutorelease", my_objc_retainAutorelease, (void*)&origin_objc_retainAutorelease};
//    binds[13] = (struct rebinding){"objc_retainAutoreleaseReturnValue", my_objc_retainAutoreleaseReturnValue, (void*)&origin_objc_retainAutoreleaseReturnValue};
//    binds[14] = (struct rebinding){"objc_retainAutoreleasedReturnValue", my_objc_retainAutoreleasedReturnValue, (void*)&origin_objc_retainAutoreleasedReturnValue};
//    binds[15] = (struct rebinding){"objc_retainBlock", my_objc_retainBlock, (void*)&origin_objc_retainBlock};
    binds[0] = (struct rebinding){"objc_storeStrong", my_objc_storeStrong, (void*)&origin_objc_storeStrong};
//    binds[17] = (struct rebinding){"objc_storeWeak", my_objc_storeWeak, (void*)&origin_objc_storeWeak};
    
    rebind_symbols(binds, 1);
    
//    NSLog(@"my_objc_retainBlock:)
}
@end
















