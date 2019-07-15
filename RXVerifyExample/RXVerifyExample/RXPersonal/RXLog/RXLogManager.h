//
//  RXLogManager.h
//  RXVerifyExample
//
//  Created by ceshi on 2017/11/5.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXLogManager : NSObject



@property (nonatomic, weak, nullable) UITextView *logTextView;

- (void)writeToLogTextViewVar:(nonnull NSString *)format, ...;

- (void)writeToLogTextView:(nonnull NSString *)string;



+ (nonnull RXLogManager *)sharedInstance;

@end
