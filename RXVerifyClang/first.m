#import <Foundation/Foundation.h>

@interface TmpObject : NSObject

@end

@implementation TmpObject

+ (id)array {
    return [[NSMutableArray alloc] init];
}

@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"你好世界!");
        NSObject *obj = [[NSObject alloc] init];
    }
    return 0;
}
