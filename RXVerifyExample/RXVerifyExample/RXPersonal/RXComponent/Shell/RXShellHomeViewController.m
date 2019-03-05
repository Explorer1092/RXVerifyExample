//
//  RXShellHomeViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXShellHomeViewController.h"
#import "RXComponetRoute.h"
#import "RXASDK.h"
#import "RXBSDK.h"
#import "RXCSDK.h"
#import "RXErrorSDK.h"
@interface RXShellHomeViewController ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation RXShellHomeViewController


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.textLabel.text = self.array[indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [RXComponetRoute routeViewController:@"asdk://AHomeVC?a=1&b=2&c=3" params:@{@"akey": @"11111"}];
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    UIViewController *vc = [RXComponetRoute routeViewController:@"asdk://errorVC" params:@{@"akey": @"11111"}];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    id value = [RXComponetRoute routeDataSync:@"asdk://syncData?aaa=1&bbb=2&ccc=3" params:@{@"akey": @"11111"}];
    NSLog(@"value:%@", value);
    
    [RXComponetRoute routeDataAsync:@"asdk://asyncData?aaaaa=1&bbbbb=2&ccccc=3" params:@{@"akey": @"11111"} competion:^(NSDictionary *result) {
        NSLog(@"result:%@", result);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [RXErrorSDK register];
    [RXASDK register];
    [RXBSDK register];
    [RXCSDK register];
    [RXComponetRoute updateStrategy];
    
    
    self.array = @[@"AHome", @"BHome", @"CHome"];
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
