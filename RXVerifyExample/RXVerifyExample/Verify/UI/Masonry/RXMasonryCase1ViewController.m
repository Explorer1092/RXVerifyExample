//
//  RXMasonryCase1ViewController.m
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase1ViewController.h"
#import "Masonry.h"

@interface RXMasonryCase1ViewController ()

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;

@property (weak, nonatomic) IBOutlet UIView *contentView1;
@end

@implementation RXMasonryCase1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _label1 = [UILabel new];
        _label1.backgroundColor = [UIColor yellowColor];
        _label1.text = @"label,";

        _label2 = [UILabel new];
        _label2.backgroundColor = [UIColor greenColor];
        _label2.text = @"label,";
        
        [_contentView1 addSubview:_label1];
        [_contentView1 addSubview:_label2];

        // label1: 位于左上角
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentView1.mas_top).with.offset(5);
            make.left.equalTo(_contentView1.mas_left).with.offset(2);

            // 40高度
            make.height.equalTo(@40);
            
    //        make.width.equalTo(@80);
        }];

        // label2: 位于右上角
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            //左边贴着label1
            make.left.equalTo(_label1.mas_right).with.offset(2);

            //上边贴着父view
            make.top.equalTo(_contentView1.mas_top).with.offset(5);

            //右边的间隔保持大于等于2，注意是lessThanOrEqual
            //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
            //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
            make.right.lessThanOrEqualTo(_contentView1.mas_right).with.offset(-2);
    //        make.right.equalTo(_contentView1.mas_right).with.offset(-2);

            //只设置高度40
            make.height.equalTo(@40);
        }];
    
    
    
}
#pragma mark - Actions

- (IBAction)stepperValueChanged:(UIStepper *)sender {

    switch (sender.tag) {
        case 0:
            _label1.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;

        case 1:
            _label2.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;

        default:
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    NSMutableString *ret = [NSMutableString new];

    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }

    return ret.copy;
}


@end
