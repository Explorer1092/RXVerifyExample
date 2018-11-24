//
//  RXAFNTest4Object.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXAFNTest4Object : NSObject


// b的值依赖a, b是只读的
@property (nonatomic, assign) int a;
@property (nonatomic, readonly) int b;



// d的值依赖c,在c的赋值过程中会重新赋值d
@property (nonatomic, assign) int c;
@property (nonatomic, assign) int d;


// e,f之间的关系就相当于AFN中的 AFSecurityPolicy中
// e: pinnedCertificates
// f: pinnedPublicKeys
@property (nonatomic, assign) int e;




@property (nonatomic, assign) int g;
@property (nonatomic, assign) int h;





@end
