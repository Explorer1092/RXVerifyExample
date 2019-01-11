//
//  RXBlockQSortBRObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockQSortBRObject.h"
static int _s_compar (void *tmp, const void *l, const void *r) {
    char *left = *(char **)l;
    char *right = *(char **)r;
    return strncmp(left, right, 1);
}
@implementation RXBlockQSortBRObject

- (void)test_qsort_r
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    NSLog(@"qsort_r before");
    [self _print_char_array:myCharacters len:3];
    qsort_r(myCharacters, 3, sizeof(char *), NULL, _s_compar);
    NSLog(@"qsort_r after");
    [self _print_char_array:myCharacters len:3];
}

- (void)test_qsort_b
{
    char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    NSLog(@"qsort_b before");
    [self _print_char_array:myCharacters len:3];
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    NSLog(@"qsort_b after");
    [self _print_char_array:myCharacters len:3];
}

- (void)_print_char_array:(char **)charArray len:(int)len
{
    for (int i = 0; i < len; i++) {
        char *tmp = charArray[i];
        NSLog(@"%s", tmp);
    }
}

@end
