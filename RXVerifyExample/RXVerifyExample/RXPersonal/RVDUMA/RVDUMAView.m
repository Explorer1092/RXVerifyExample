//
//  RVDUMAView.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVDUMAView.h"
#import "DMLine.h"

@interface RVDUMAView ()

@property (nonatomic, strong) DMLine *currentLine;
@property (nonatomic, assign) CGPoint beginPoint;
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
    newLine.lineWidth = 4;
    newLine.alpha = 1.0;
    newLine.bezierPath = [UIBezierPath bezierPath];
    newLine.bezierPath.lineCapStyle = kCGLineCapButt;  //线条拐角
    newLine.bezierPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    
    
    newLine.bezierPath.lineJoinStyle = kCGLineCapButt;  //终点处理
    newLine.bezierPath.lineJoinStyle = kCGLineCapRound;  //线条拐角
    [newLine.bezierPath moveToPoint:loc];
    return newLine;
}





#pragma mark - Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    
    [self.undoManager beginUndoGrouping];
    self.beginPoint = point;
    DMLine *newLine = [self createNewLineWithLocation:point];
    self.currentLine = newLine;
    [self addLine:self.currentLine];
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.currentLine.bezierPath addLineToPoint:point];
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
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
    for (NSInteger i = 0; i < self.linesCompleted.count; i++) {
        DMLine *line = self.linesCompleted[i];
        
        
        
        UIColor *fillColor = line.fillColor;
        [fillColor set];
        
        UIBezierPath *aPath = line.bezierPath;
        aPath.lineWidth = line.lineWidth;
        
            [aPath stroke];
        
    }
    
    
}


@end
