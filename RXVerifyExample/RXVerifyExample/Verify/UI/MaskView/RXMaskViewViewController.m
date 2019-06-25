//
//  RXMaskViewViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMaskViewViewController.h"

@interface RXMaskViewViewController ()

@end

@implementation RXMaskViewViewController
//- (void)resetTeacherViewLayer
//{
//    if(self.remoteLayer)
//    {
//        [self.remoteLayer removeFromSuperlayer];
//    }
//
//    UIImage *img = [self.roomView skinImageWithKey:VKRoomSkinBackgroundImgKey];
//    UIView *view = self.remoteVideoView.superview.superview.superview;
//
//    CGRect rect=[self.remoteVideoView convertRect:self.remoteVideoView.bounds toView:view];
//
//    CALayer *layer = [CALayer layer];
//    self.remoteLayer = layer;
//    layer.frame = self.remoteVideoView.bounds;
//    [self.remoteVideoView.layer addSublayer:layer];
//
//    UIGraphicsBeginImageContextWithOptions(self.remoteVideoView.bounds.size, NO, [UIScreen mainScreen].scale);
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:VKRaptorRoomValue(20)];
//    [[UIColor clearColor] setFill];
//
//    [img drawInRect:CGRectMake(-(rect.origin.x), -(rect.origin.y), view.size.width, view.size.height)];
//
//    [path fillWithBlendMode:kCGBlendModeClear alpha:0];
//    layer.contents = (__bridge id)(UIGraphicsGetImageFromCurrentImageContext().CGImage);
//    UIGraphicsEndImageContext();
//}
- (CAShapeLayer *)maskStyle1:(CGRect)rect {
    CGFloat x = rect.size.width/2.0;
    CGFloat y = rect.size.height/2.0;
    CGFloat radius = MIN(x, y);
    //
    UIBezierPath *cycle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y)
                                                         radius:radius
                                                     startAngle:0.0
                                                       endAngle:2*M_PI
                                                      clockwise:YES];
    //
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [cycle CGPath];
    maskLayer.fillRule = kCAFillRuleNonZero;
    
    return maskLayer;
}
- (CAShapeLayer *)maskStyle2:(CGRect)rect {
    //
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    CGFloat x = rect.size.width/2.0;
    CGFloat y = rect.size.height/2.0;
    CGFloat radius = MIN(x, y);
    //
    UIBezierPath *cycle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y)
                                                         radius:radius
                                                     startAngle:0.0
                                                       endAngle:2*M_PI
                                                      clockwise:YES];
    [path appendPath:cycle];
    //
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [path CGPath];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    return maskLayer;
}
- (void)test1 {
    CGFloat width = 200;
    UIView *destView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, width, width)];
    destView.backgroundColor = [UIColor redColor];
    [self.view addSubview:destView];
    
    
    
    UIImage *img = [[UIColor blackColor] rx_imageWithSize:CGSizeMake(self.view.size.width, self.view.height)];
    UIView *view = destView.superview;
    CGRect rect = [destView convertRect:destView.bounds toView:view];
    CALayer *layer = [CALayer layer];
    [destView.layer addSublayer:layer];
    layer.frame = destView.bounds;
    UIGraphicsBeginImageContextWithOptions(destView.bounds.size, NO, [UIScreen mainScreen].scale);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:20];
    [[UIColor clearColor] setFill];
    [img drawInRect:CGRectMake(-(rect.origin.x), -(rect.origin.y), view.size.width, view.size.height)];
    [path fillWithBlendMode:kCGBlendModeClear alpha:0];
    layer.contents = (__bridge id)(UIGraphicsGetImageFromCurrentImageContext().CGImage);
    UIGraphicsEndImageContext();
}
- (void)test2 {
    CGFloat width = 200;
    UIView *destView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 300, width)];
    destView.backgroundColor = [UIColor redColor];
    [self.view addSubview:destView];
    
    
    //创建layer
    CALayer *layer = [CALayer layer];
    //设置bounds
    layer.bounds = destView.bounds;
    //设置中心点位置（默认中心点）
    layer.position = CGPointMake(width/ 2.0, width / 2.0);
    //背景颜色
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    //添加到视图上
    [destView.layer addSublayer:layer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self test2];
    
    
    
    
    
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0, 0, width, width);
//
//    [view.layer addSublayer:layer];
    
//    uiview *view1 = [[uiview alloc]initwithframe:cgrectmake(10, 100, 300, 400)];
//    view1.backgroundcolor = [uicolor redcolor];
//    [self.view addsubview:view1];
//    UIBezierPath *path = [UIBezierPath bezierpathwithroundedrect:view1.bounds byroundingcorners:uirectcornertopright| uirectcornertopleft cornerradii:cgsizemake(10, 10)];//指定圆角位置 大小
//    NSLog(@"%@", NSStringFromCGRect(view.bounds));
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(100, 100)];
//
//    CAShapeLayer *masklayer = [[CAShapeLayer alloc] init];
//    masklayer.frame = view.bounds;
//    masklayer.path = path.CGPath;
//    view.layer.mask = masklayer;
    

    
    
//    CALayer *maskLayer = [self maskStyle2:CGRectMake(0, 0, width, width)];

    
//    [view.layer addSublayer:maskLayer];
    
    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 300, width, width)];
//    view2.backgroundColor = [UIColor greenColor];
//
//
//    [self.view addSubview:view2];
//    [self.view addSubview:destView];
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
