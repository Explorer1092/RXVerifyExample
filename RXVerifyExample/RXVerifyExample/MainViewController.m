//
//  MainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXYellowView.h"
#import <Masonry/Masonry.h>
#import "NSObject+RXVerifyExample.h"
#import "RXWeakTestViewController.h"
#import "RXDirectionViewController.h"

static NSInteger a = 0;

// xzj_todo https://www.ojit.com/article/1906717
// xzj_todo linux 学习 https://www.zhihu.com/question/19606660
@interface MainViewController ()


@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *functionItems;

@property (nonatomic, strong) UIView *yellowView;


@end

@implementation MainViewController
- (CGFloat)valueWith:(CGFloat)ab {
    CGFloat x = ab * 2;
    NSInteger x2 = ceil(x);
    return x2 / 2.0f;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    a++;
    NSLog(@"a:%zd", a);
    
    // Do any additional setup after loading the view from its nib.
    
//    NSObject *object1 = [NSObject new];
    
    
    
//    CGFloat ab = 3.2;
//    CGFloat abc = 3.5;
//    CGFloat abcd = 3.6;
//    
//    CGFloat ab_r = [self valueWith:ab];
//    CGFloat abc_r = [self valueWith:abc];
//    CGFloat abcd_r = [self valueWith:abcd];
    
    
    
//    NSString *str1 = NSStringFromClass([self class]);
//    NSString *str2 = @"MainViewController";
//    
//    BOOL b1 = [str1 isEqual:str2];
//    BOOL b2 = [str1 isEqualToString:str2];
//    
//    NSLog(@"b1:%zd, b2:%zd", b1, b2);
    
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
                           @"RXMaskView", @"VKAnimationQueue", @"RXKS",
                           @"RXParent", @"RXVRC", @"RXUIAnimation",
                           @"RXAppStore", @"RXViewContentMode", @"RXMasonryTest",
                           @"RXDirection", @"RXStrangeA", @"RXViewHolder",
                           @"RXStrangeXR", @"RXNotificationFirst", @"RXViewVisiable",
                           @"RXVisiableTest", @"RXTestManager"
    ];
    
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
//    object = @"RXKS";
//        object = @"RXMaskView";
//    object = @"RXParent";
//    object = @"RVWeb";
    object = @"RXVRC";
    
    object = @"RXUIAnimation";
    
    object = @"RXAppStore";
    
    object = @"RXMasonryTest";
    
    object = @"RXJLRouter";
    
    
//    object = @"RXTestManager";
    
//    object = @"RXDirection";
    
//    object = @"RXStrangeA";
    
//    object = @"RXViewVisiable";
    
//    object = @"RXVisiableTest";
    
//    object = @"RXNotificationFirst";
    
    
#endif
    
    [self performSelector:@selector(gotoExampleVCWithName:) withObject:object afterDelay:1];
    
    UIView *tmpView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    tmpView.backgroundColor = [UIColor whiteColor];
    tmpView.layer.shadowOffset = CGSizeMake(0, 0);
    tmpView.layer.shadowColor = [UIColor redColor].CGColor;
    tmpView.layer.shadowOpacity = 0.5f;
    tmpView.layer.shadowRadius = 3;
    tmpView.layer.cornerRadius = 4;
//    tmpView.layer.masksToBounds = YES;
    [self.tableView addSubview:tmpView];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            NSLog(@"111");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"222");
        });
        NSLog(@"333");
    });
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
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
    
//    RXWeakTestViewController *vc = [RXWeakTestViewController new];
//    NSLog(@"vc:%@", vc);

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
