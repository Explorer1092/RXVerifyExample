//
//  RVWYViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVWYViewController.h"

@interface RVWYViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RVWYViewController

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
    
    CGFloat topViewHeight = 50;
    CGFloat svHeight = height - topViewHeight - 64;
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, topViewHeight)];
    self.topView.backgroundColor = [UIColor redColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topViewHeight, width, svHeight)];
    NSArray *colorAry = @[[UIColor greenColor], [UIColor blackColor], [UIColor whiteColor], [UIColor blueColor], [UIColor orangeColor]];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(width * colorAry.count, svHeight);
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.scrollView];
    

    for (NSInteger i = 0; i < colorAry.count; i++) {
        CGFloat x = i * width;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(x, 0, width, svHeight)];
//        tableView.backgroundColor = color;
        tableView.tag = i + 1000;
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [self.scrollView addSubview:tableView];
    }
    
    
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
