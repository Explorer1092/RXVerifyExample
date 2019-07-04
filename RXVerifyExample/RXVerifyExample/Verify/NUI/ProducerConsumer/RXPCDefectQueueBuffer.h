//
//  RXPCDefectQueueBuffer.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXPCDefectQueueBuffer : NSObject
#pragma mark - Constructor And Destructor

@property (nonatomic, assign, readonly) NSInteger maxLength;
+ (id)defaultQueueBuffer;
- (id)initWithMaxLength:(NSInteger)length;
- (void)push:(id)data;
- (id)pop;

@property (nonatomic, readonly) BOOL empty;
@property (nonatomic, readonly) BOOL full;

@end

NS_ASSUME_NONNULL_END
