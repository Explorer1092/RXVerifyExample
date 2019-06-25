
#import <Foundation/Foundation.h>


@interface RXAAAA : NSObject
@end

@implementation RXAAAA
+ (id)array {
    return [[NSMutableArray alloc] init];
}
@end


int main1(int argc, const char * argv[]) {
    id value = [RXAAAA array];
    return 0;
}
int main1_1(int argc, const char * argv[]) {
    id value = [RXAAAA array];
    NSLog(@"%@", value);
    return 0;
}

int main2(int argc, const char * argv[]) {
    __weak id value = [RXAAAA array];
    NSLog(@"%@", value);
    return 0;
}
int main2_2(int argc, const char * argv[]) {
    __weak id value = [RXAAAA array];
    return 0;
}
int main3(int argc, const char * argv[]) {
    __autoreleasing id value = [RXAAAA array];
    NSLog(@"%@", value);
    return 0;
}
int main4(int argc, const char * argv[]) {
    __unsafe_unretained id value = [RXAAAA array];
    NSLog(@"%@", value);
    return 0;
}