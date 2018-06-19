//
//  RXSYViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/15.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXSYViewController.h"

#import <objc/runtime.h>
#import "fishhook.h"



//
//@interface Tmp2Object : NSObject
//- (void)testTmp2;
//@end
//
//@implementation Tmp2Object
//- (void)testTmp2
//{
//
//}
//@end
static NSMutableDictionary *mutDic = nil;


static void __private_HookBlockToPrintHelloWorld()
{
    NSLog(@"hello world");
}

static void __private_HookBlockToPrintArguments(void *cSelf, ...)
{
    printf("__private: %p", cSelf);
    NSString *key = [NSString stringWithFormat:@"%p", cSelf];
    va_list ap = {0};
    NSLog(@"hello world22222");
    
}


//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};

//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __Block_byref_a_0 *a; // by ref
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};


typedef struct RX_block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
}RX_block_impl;

typedef struct RX_main_block_impl {
    struct RX_block_impl impl;
}RX_main_block_impl;




// 以下题目都针对于任意 void (^)() 形式的block
// 1. 实现函数,将block的实现修改为 NSLog(@"Hello world")
// 也就是说在调完这个函数后调用block()时,并不调用原始实现,而是输出"Hello world"
void HookBlockToPrintHelloWorld(id block) {
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    // 这里千万不能用 RX_block_impl impl = main_block_impl->impl;
    // 要不然获取的内存地址不正确
    RX_block_impl *impl = &(main_block_impl->impl);
    void *exchang = (void *)__private_HookBlockToPrintHelloWorld;
    printf("Hook block %p\n", block);
    printf("Hook main_block_impl %p\n", main_block_impl);
    printf("Hook impl %p\n", impl);
    printf("Hook FuncPtr before %p\n", impl->FuncPtr);
    impl->FuncPtr = exchang;
    printf("Hook FuncPtr after %p\n", impl->FuncPtr);
}

void HookBlockToPrintHelloWorld2(id block) {
    
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    // 这里千万不能用 RX_block_impl impl = main_block_impl->impl;
    // 要不然获取的内存地址不正确
    RX_block_impl *impl = &(main_block_impl->impl);
    
    printf("Hook block %p\n", block);
    printf("Hook main_block_impl %p\n", main_block_impl);
    printf("Hook impl %p\n", impl);
    printf("Hook FuncPtr before %p\n", impl->FuncPtr);
    rebind_symbols((struct rebinding[2]){{"close", __private_HookBlockToPrintHelloWorld, &(impl->FuncPtr)}}, 1);

}


// 2. 实现下面的函数, 将block的实现修改成打印所有入参,并调用原始实现
// void (^block)(int a, NSString *b) = ^(int a, NSString *b) {
//    NSLog(@"block invoke");
// }
// HookBlockToPrintArguments(block);
// block(123, @"aaa");
// 输出 "123, aaa" 和  block invoke
void HookBlockToPrintArguments(id block) {
    NSLog(@"%@", block);
    RX_main_block_impl *main_block_impl = (__bridge RX_main_block_impl *)block;
    RX_block_impl *impl = &(main_block_impl->impl);
    
    NSString *key = [NSString stringWithFormat:@"%p", block];
//    id value = (__bridge id)impl->FuncPtr;
    [mutDic setObject:CFBridgingRelease(impl->FuncPtr) forKey:key];
    
    rebind_symbols((struct rebinding[2]){{"func", __private_HookBlockToPrintArguments, &(impl->FuncPtr)}}, 1);
}

// 3. 实现下面的函数,使的调用这个函数之后,后面创建的任意block都能自动实现第二题的功能

void HookEveryBlockToPrintArguments(void) {
    
}




@interface RXSYViewController ()

@end

@implementation RXSYViewController



//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};

//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    __Block_byref_a_0 *a; // by ref
//    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    }
//};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mutDic = [NSMutableDictionary new];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self testHookBlockToPrintHelloWorld];
    
    [self testHookBlockToPrintArguments];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testHookBlockToPrintHelloWorld {
    
    void (^block1)(int a, NSString *b) = ^(int a, NSString *b) {
        NSLog(@"block1 invoke");
    };
    HookBlockToPrintHelloWorld(block1);
    block1(123, @"aaa");
    
    
    void (^block2)(void) = ^() {
        NSLog(@"block2 invoke");
    };
    HookBlockToPrintHelloWorld2(block2);
    block2();
}
- (void)testHookBlockToPrintArguments
{
    void (^block1)(int a, NSString *b) = ^(int a, NSString *b) {
        NSLog(@"block1 invoke");
    };
    HookBlockToPrintArguments(block1);
    block1(123, @"aaa");
    
    
    
    void (^block2)(void) = ^() {
        NSLog(@"block2 invoke");
    };
    HookBlockToPrintArguments(block2);
    block2();
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
