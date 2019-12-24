//
//  RXMasonryTestViewController.m
//  RXVerifyExample
//
//  Created by xuzhijun on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryTestViewController.h"
#import "RXMasonryCaseObject.h"








@interface RXMasonryTestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation RXMasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *ary = @[@"抗拉伸与抗压缩", @"", @""];
    NSMutableArray *dataArray = [NSMutableArray new];
    for (NSInteger i = 0; i < ary.count; i++) {
        RXMasonryCaseObject *obj = [RXMasonryCaseObject new];
        obj.index = i;
        obj.subTitle = ary[i];
        [dataArray addObject:obj];
    }
    self.dataArray = dataArray;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self _gotoVCWithIndex:0];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *clsStr = @"UITableViewCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:clsStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:clsStr];
    }
    RXMasonryCaseObject *obj = self.dataArray[indexPath.row];
    cell.textLabel.text = obj.title;
    cell.detailTextLabel.text = obj.subTitle;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self _gotoVCWithIndex:indexPath.row];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark - Private
- (void)_gotoVCWithIndex:(NSInteger)index {
    if (index >= self.dataArray.count) {
        return;
    }
    RXMasonryCaseObject *obj = self.dataArray[index];
    Class cls = NSClassFromString(obj.caseViewControllerClassString);
    if (cls != nil) {
        UIViewController *vc = [cls new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
