//
//  RXMasonryTestViewController.m
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/11/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryTestViewController.h"
#import <Masonry/Masonry.h>

@interface RXMasonryTestViewController ()
@property (nonatomic, strong) UILabel *autoLabel;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger index;
@end

@implementation RXMasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.autoLabel];
    
    [self.autoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.top.equalTo(@(100));
        make.width.equalTo(@(100));
    }];
    self.autoLabel.numberOfLines = 2;
    self.index = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    NSArray *ary = @[@"第一个结束",
                    @"第二个文字第二个文字第二个文字第二个文字第二个文字第二个结束",
                    @"第三个文字第三个文字第三个文字第三个结束",
                    @"第四个文字第四个文字第四个文字第四个文字第四个文字第四个文字第四个文字第四个文字第四个文字第四个文字第四个结束",
                     @"第五个文字第五个结束"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        weakSelf.index = weakSelf.index % ary.count;
        NSString *text = [ary objectAtIndex:weakSelf.index];
        weakSelf.autoLabel.text = text;
        weakSelf.index++;
    }];
}




- (UILabel *)autoLabel {
    if (_autoLabel == nil) {
        _autoLabel = [UILabel new];
        _autoLabel.backgroundColor = [UIColor redColor];
        _autoLabel.numberOfLines = 0;
    }
    return _autoLabel;
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
