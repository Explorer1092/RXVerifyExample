//
//  RVRefreshViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/10.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVRefreshViewController.h"
#import "RXRefreshView.h"
@interface RVRefreshViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) RXRefreshView *rxRefreshView;

@end

@implementation RVRefreshViewController






#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.tableFooterView = [UIView new];
    self.rxRefreshView = [RXRefreshView attachToScrollView:self.tableView];
    
    
    NSLog(@"offset:%@, inset:%@", NSStringFromCGPoint(self.tableView.contentOffset), NSStringFromUIEdgeInsets(self.tableView.contentInset));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override
#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
