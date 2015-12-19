//
//  RVWYViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVWYViewController.h"
#import "RXLimitView.h"
#import "RXInfiniteView.h"
#import "RXLabelView.h"

@interface RVWYViewController ()<UITableViewDataSource, UITableViewDelegate, RXLimitViewDataSource>

@property (nonatomic, strong) RXLabelView *limitTopView;
@property (nonatomic, strong) RXLimitView *rxLimitView;

@property (nonatomic, strong) RXLabelView *infiniteTopView;
@property (nonatomic, strong) RXInfiniteView *rxInfiniteView;

@end

@implementation RVWYViewController

#pragma mark - RXLimitViewDataSource
- (NSInteger)numberOfPageInRXLimitView:(RXLimitView *)rxLimitView
{
    return 5;
}

- (UIView *)rxLimitView:(RXLimitView *)rxLimitView viewForAtIndex:(NSInteger)index
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rxLimitView.width, rxLimitView.height)];
    tableView.tag = index + 1000;
    tableView.delegate = self;
    tableView.dataSource = self;
    return tableView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"klsjglksgj";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", tableView.tag];
    return cell;
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat topViewHeight = 30;
    CGFloat svHeight = 200;
    
    self.limitTopView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, topViewHeight)];
    self.limitTopView.backgroundColor = [UIColor redColor];
    [self.limitTopView updateConstraintsWithLeft:10];
    self.limitTopView.label.text = @"有限的";
    
    
    self.rxLimitView = [[RXLimitView alloc] initWithFrame:CGRectMake(0, topViewHeight, width, svHeight)];
    self.rxLimitView.dataSource = self;
    [self.rxLimitView reloadData];
    
    [self.view addSubview:self.limitTopView];
    [self.view addSubview:self.rxLimitView];
    
    
    CGFloat inTopViewY = topViewHeight + svHeight;
    self.infiniteTopView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, inTopViewY, width, topViewHeight)];
    [self.infiniteTopView updateConstraintsWithLeft:10];
    self.infiniteTopView.label.text = @"无限的";
    self.infiniteTopView.backgroundColor = [UIColor greenColor];
    
    CGFloat inHeight = height - topViewHeight * 2 - svHeight - 64;
    CGFloat inY = inTopViewY + topViewHeight;
    self.rxInfiniteView = [[RXInfiniteView alloc] initWithFrame:CGRectMake(0, inY, width, inHeight)];
    self.rxInfiniteView.backgroundColor = [UIColor blueColor];
    
    
    [self.view addSubview:self.infiniteTopView];
    [self.view addSubview:self.rxInfiniteView];
    

    
    
}
- (void)initializeAction
{
    
}


#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
