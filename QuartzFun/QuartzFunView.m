//
//  QuartzFunView.m
//  QuartzFun
//
//  Created by Cusen on 15/8/20.
//  Copyright © 2015年 cusen. All rights reserved.
//

#import "QuartzFunView.h"
#import "UIColor+Random.h"

@implementation QuartzFunView

- (CGRect)currentRect
{
    return CGRectMake(self.firstToushLocation.x,
                      self.firstToushLocation.y,
                      self.lastToushLocation.x - self.firstToushLocation.x,
                      self.lastToushLocation.y - self.firstToushLocation.y);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, self.currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
    
    switch (self.shapeType) {
        case KLineShape:
            CGContextMoveToPoint(context, self.firstToushLocation.x, self.firstToushLocation.y);
            CGContextAddLineToPoint(context, self.lastToushLocation.x, self.lastToushLocation.y);
            CGContextStrokePath(context);
            break;
        case KRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case KEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case KImageShape:{
            CGFloat horizontalOffset = self.drawImage.size.width / 2;
            CGFloat verticalOffset  = self.drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(self.lastToushLocation.x - horizontalOffset,
                                            self.lastToushLocation.y - verticalOffset);
            [self.drawImage drawAtPoint:drawPoint];
            break;
        }
        default:
            break;
    }
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"01.jpg"];
    }
    return self;
}

//从xib和分镜文件中加载对象实例时实际调用的时initWithCoder:方法，而不是调用init和initWithFrame:
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"01.jpg"];
    }
    return self;
}

#pragma mark - Touch Handling
//手指第一次触摸时调用
- (void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    if (self.useRandomColor)
    {
        self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    self.firstToushLocation = [touch locationInView:self];
    self.lastToushLocation = [touch locationInView:self];
    [self setNeedsDisplay];
}

//手指在屏幕上拖动时持续调用
- (void)touchesMoved:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastToushLocation = [touch locationInView:self];
    
    if (self.shapeType == KImageShape)
    {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset  = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect,
                                      CGRectMake(self.lastToushLocation.x - horizontalOffset,
                                                 self.lastToushLocation.y - verticalOffset,
                                                 self.drawImage.size.width,
                                                 self.drawImage.size.height));
    }
    self.redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:self.redrawRect];
    //[self setNeedsDisplay];
}

//手机离开屏幕时调用
- (void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastToushLocation = [touch locationInView:self];
    
    if (self.shapeType == KImageShape)
    {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset  = self.drawImage.size.height / 2;
        self.redrawRect = CGRectUnion(self.redrawRect,
                                      CGRectMake(self.lastToushLocation.x - horizontalOffset,
                                                 self.lastToushLocation.y - verticalOffset,
                                                 self.drawImage.size.width,
                                                 self.drawImage.size.height));
    }
    self.redrawRect = CGRectInset(self.redrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:self.redrawRect];
    //[self setNeedsDisplay];
}
@end
