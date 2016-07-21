//
//  RVDUMAView.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVDUMAView.h"
#import "DMLine.h"
CGPoint midPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}


@interface RVDUMAView ()

@property (nonatomic, strong) DMLine *currentLine;
@property (nonatomic, assign) CGPoint beginPoint;
//@property (nonatomic, assign) CGPoint tmpPoint;
@property (nonatomic, strong) NSMutableArray *linesCompleted;


@end
@implementation RVDUMAView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = RX_Window_Width;
        CGFloat height = RX_Window_Height - 64;
        self.linesCompleted = [NSMutableArray array];
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}


#pragma mark - Private
- (void)addLine:(DMLine *)line
{
    if (self.linesCompleted.lastObject == line) {
        return;
    }
    [[self.undoManager prepareWithInvocationTarget:self] removeLine:line];
    [self.linesCompleted addObject:line];
    [self setNeedsDisplay];
}

- (void)removeLine:(DMLine *)line
{
    if ([self.linesCompleted containsObject:line]) {
        [[self.undoManager prepareWithInvocationTarget:self] addLine:line];
        [self.linesCompleted removeObject:line];
        [self setNeedsDisplay];
    }
}
- (DMLine *)createNewLineWithLocation:(CGPoint)loc
{
    DMLine *newLine = [[DMLine alloc] init];
    newLine.fillColor = [UIColor blackColor];
    newLine.lineWidth = 10;
    newLine.alpha = 1.0;
    newLine.bezierPath = [UIBezierPath bezierPath];
    newLine.bezierPath.lineCapStyle = kCGLineCapButt;  //线条拐角
    newLine.bezierPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    
    newLine.isComplete = NO;
    newLine.bezierPath.lineJoinStyle = kCGLineCapButt;  //终点处理
    newLine.bezierPath.lineJoinStyle = kCGLineCapRound;  //线条拐角
    [newLine.bezierPath moveToPoint:loc];
    [newLine.pointArray addObject:[NSValue valueWithCGPoint:loc]];
    return newLine;
}





#pragma mark - Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    
//    CGPoint point1  = [touch previousLocationInView:self];
//    CGPoint point2    = [touch locationInView:self];
    
//    NSLog(@"point1:%@, point2:%@", NSStringFromCGPoint(point1), NSStringFromCGPoint(point2));
    
    
    [self.undoManager beginUndoGrouping];
    self.beginPoint = point;
//    self.tmpPoint = point;
    DMLine *newLine = [self createNewLineWithLocation:point];
    self.currentLine = newLine;
    [self addLine:self.currentLine];
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    
//    CGPoint point1  = [touch previousLocationInView:self];
//    CGPoint point2    = [touch locationInView:self];
//    
//    
//    // 阈值大于2
    CGFloat x = fabs(point.x - self.beginPoint.x);
    CGFloat y = fabs(point.y - self.beginPoint.y);

    if (x + y <= 10) {
        return;
    }
//    NSLog(@"point1:%@, point2:%@", NSStringFromCGPoint(point1), NSStringFromCGPoint(point2));

    self.beginPoint = point;
    
    [self.currentLine.bezierPath addLineToPoint:point];
    [self.currentLine.pointArray addObject:[NSValue valueWithCGPoint:point]];

    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.currentLine.isComplete = YES;
    [self setNeedsDisplay];
    [self.undoManager endUndoGrouping];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}



#pragma mark - Override
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)didMoveToWindow
{
    [self becomeFirstResponder];
}

- (void)drawRect:(CGRect)rect
{

    
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    for (NSInteger i = 0; i < self.linesCompleted.count; i++) {
        DMLine *line = self.linesCompleted[i];
        NSInteger offset = 1;
        if (line.isComplete && i < 3) {
            CGPoint prePoint = CGPointMake(-1, -1);
            for (NSInteger j = 0; j < line.pointArray.count; j+=offset) {
                if (j+offset >= line.pointArray.count) {
                    continue;
                }
                CGPoint p0 = [line.pointArray[j] CGPointValue];
                CGPoint p1 = [line.pointArray[j + offset] CGPointValue];
                
                
//                NSLog(@"p0:%@,p1:%@", NSStringFromCGPoint(p0), NSStringFromCGPoint(p1));
                
                CGPoint endPoint = midPoint(p0, p1);
                
                
                if (prePoint.x == -1) {
                    prePoint = p0;
                }
                NSLog(@"start:%@ mid/control:%@ end:%@", NSStringFromCGPoint(prePoint), NSStringFromCGPoint(p0), NSStringFromCGPoint(endPoint));
                CGContextMoveToPoint(context, prePoint.x, prePoint.y);
                
                CGContextAddQuadCurveToPoint(context, p0.x, p0.y, endPoint.x, endPoint.y);
                
                
                
                CGContextSetLineCap(context, kCGLineCapRound);
//                CGContextSetLineJoin(context, kCGLineJoinMiter);
                CGContextSetLineJoin(context, kCGLineJoinRound);
//                CGContextSetLineJoin(context, kCGLineJoinBevel);
                
                
                CGContextSetLineWidth(context, line.lineWidth);
                CGContextSetStrokeColorWithColor(context, line.fillColor.CGColor);
                
                CGContextStrokePath(context);
                prePoint = endPoint;
            }
        } else {
            
            
            UIColor *fillColor = line.fillColor;
            [fillColor set];
            
            
            
            UIBezierPath *aPath = line.bezierPath;
            
            aPath.lineWidth = line.lineWidth;
            
            [aPath stroke];
            
        }
        
        

    }
    
    
    
//    CGContextRef context=UIGraphicsGetCurrentContext();
//    
//    
//    //线条拐角样式，设置为平滑
//    CGContextSetLineJoin(context,kCGLineJoinRound);
//    //线条开始样式，设置为平滑
//    CGContextSetLineCap(context, kCGLineCapRound);
//    
//    
//    for (NSInteger i = 0; i < self.linesCompleted.count; i++) {
//        DMLine *line = self.linesCompleted[i];
//        
//        if (line.pointArray.count <= 0) {
//            continue;
//        }
//        
//        UIColor *fillColor = line.fillColor;
////        [fillColor set];
//        
//        
//        
//        
//        CGContextSetLineWidth(context, line.lineWidth);
//        CGContextSetLineWidth(context, 10);
//        CGContextBeginPath(context);
//        CGPoint myStartPoint = [[line.pointArray objectAtIndex:0] CGPointValue];
//        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
//        
//        for (int j=0; j<line.pointArray.count; j++)
//        {
//            NSValue *value = line.pointArray[j];
//            CGPoint myEndPoint= [value CGPointValue];
//            //--------------------------------------------------------
//            CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
//        }
//        //获取colorArray数组里的要绘制线条的颜色
//        //设置线条的颜色，要取uicolor的CGColor
//        CGContextSetStrokeColorWithColor(context,[fillColor CGColor]);
//        //-------------------------------------------------------
//        //设置线条宽度
//        //保存自己画的
//        CGContextStrokePath(context);
//        
//        
//    }
//    
    
    
}


@end
