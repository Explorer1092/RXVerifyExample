//
//  MainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXYellowView.h"

@interface MainViewController ()


@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *functionItems;

@property (nonatomic, strong) UIView *yellowView;


@end

@implementation MainViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.view.backgroundColor = [UIColor redColor];
    
//    self.yellowView = [[RXYellowView alloc] initWithFrame:CGRectMake(0, 0, RX_Window_Width, RX_Window_Height)];
//    self.yellowView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
//    [[UIApplication sharedApplication].keyWindow addSubview:self.yellowView];
    
    self.functionItems = @[@"RVMenu", @"RVRefresh", @"RVRect",
                           @"RVScroll", @"RVTrans", @"RVWY",
                           @"RVPopupBox", @"RVButton", @"RVUPPay",
                           @"RVGCD", @"RVAFNetworking", @"RVAnimation",
                           @"RVDebug", @"RVStrongWeakSelf", @"RVViewCycle",
                           @"RVRunLoop", @"RVRunLoop2", @"RVRunTime",
                           @"RVLock", @"RVUtility", @"RVYYKit",
                           @"RVLayer", @"RVOSS", @"RVDUMA",
                           @"RVWeb", @"RVStock", @"RVCopy",
                           @"RVOCData", @"RVQQ", @"RVThread",
                           @"RVTDW", @"RVLLDB", @"RXMethodForward",
                           @"RVEventResponseList", @"RXObjectCreate", @"RVGCD2",
                           @"RXMRSW", @"RXCurrentQueue", @"RXTargetQueue",
                           @"RXQueueSpecial", @"RVAutoRelease", @"RVRTPrint",
                           @"RVMsgForward", @"RVAddMethod", @"RVArrayCopy",
                           @"RXFramework", @"RXNSObjectForSelector", @"RXMVVMList",
                           @"RXMultNotification", @"RXSY", @"RVGCDQueues",
                           @"RXUIListPerformance", @"RXCompressWhitSpace", @"RXMVVMLogin",
                           @"RXRAC", @"RXMacro", @"RXRACClass",
                           @"RXRACDemo", @"RXOCKeywordMethodName", @"RXRACMT",
                           @"RXUncaughtExceptionHandler", @"RXOPMQ", @"RXMethodListDemo",
                           @"RXAspects", @"RXCLanguage", @"RXAFNetworking",
                           @"RXUtil", @"RXLayout", @"RXJLRouter",
                           @"RXAnimation", @"RXShellHome", @"RXVolume",
                           @"RXVK", @"RXTestManager", @"RXViewLevel",
                           @"RXMaskView", @"VKAnimationQueue"];
    
    // 数组倒叙
    self.functionItems = [[self.functionItems reverseObjectEnumerator] allObjects];

    NSString *object = self.functionItems.firstObject;
    
#if 1

    object = @"RVTDW";
    object = @"RVRunTime";

    object = @"RVLLDB";

//    object = @"RVMsgForward";
//    object = @"RVGCD2";
//    object = @"RVWeb";
//    object = @"RXSY";
    
//    object = @"RXAFNetworking";
//    object = @"RVGCD2";
//    object = @"RXLayout";
//    object = @"RXJLRouter";
//    object = @"RXAnimation";
//    object = @"RXShellHome";
//    object = @"RXVolume";
        object = @"RXTestManager";
//        object = @"RXMaskView";
#endif
    
    [self performSelector:@selector(gotoExampleVCWithName:) withObject:object afterDelay:1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.functionItems[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tmp = self.functionItems[indexPath.row];
    [self gotoExampleVCWithName:tmp];
}

#pragma mark - Private
- (void)gotoExampleVCWithName:(NSString *)name
{
    NSString *clsString = [NSString stringWithFormat:@"rxpage://%@ViewController", name];
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:clsString query:nil animate:YES];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/*
 
 
 
 #pragma mark - View Life Cycle
 
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 
 [self initializeUIAndData];
 [self initializeAction];
 }
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 
 self.view.backgroundColor = [UIColor redColor];
 }
 - (void)initializeAction
 {
 
 }
 
 

 
 
 */

@end
