
#import <Foundation/Foundation.h>

typedef int (^blk_t)(int);
blk_t funccccccccc(int rate)
{
    return ^(int count) {
    	return rate * count;
    };
}

id funbbbbbbbbbbbbb() {
	NSObject *obj1 = [NSObject new];
	NSLog(@"%@", obj1);
	return [[NSObject alloc] init];
}


// int main(int argc, const char * argv[]) {
//     @autoreleasepool {
//         // insert code here...
// //        NSLog(@"你好世界!");
//         NSObject *obj = [[NSObject alloc] init];
//     }
//     return 0;
// }
