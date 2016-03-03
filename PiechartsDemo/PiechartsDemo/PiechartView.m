//
//  PiechartView.m
//  PiechartsDemo
//
//  Created by LIAN on 16/2/24.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "PiechartView.h"

@implementation PiechartView

@synthesize circlePath = _circlePath;
@synthesize bgCircleLayer = _bgCircleLayer;
@synthesize strokeWidth = _strokeWidth;

@synthesize percentLayer = _percentLayer;
@synthesize percentColor = _percentColor;
@synthesize persentShow = _persentShow;

@synthesize isAnimation = _isAnimation;


-(id)initWithFrame:(CGRect)frame withStrokeWidth:(CGFloat )width andColor:(UIColor *)color andPercent:(CGFloat)percent andAnimation:(BOOL) animation
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _strokeWidth = width;
        
        _percentColor = color;
        _persentShow = percent;
        _isAnimation = animation;
        
        CGPoint centerPoint = CGPointMake(self.bounds.size.width /2, self.bounds.size.height /2);
        CGFloat radius;
        if (self.bounds.size.width <= self.bounds.size.height) {
             radius = (self.bounds.size.width -10)/2 -width;
        }
        else
        {
            radius = (self.bounds.size.height -10)/2 -width;
        }
        
        _circlePath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:M_PI_2*3 endAngle:-M_PI_2 clockwise:NO];
        
        [self buildBGCircleLayer];
    }
    return self;
}

-(void)buildBGCircleLayer
{
    _bgCircleLayer = [CAShapeLayer layer];
    _bgCircleLayer.path = _circlePath.CGPath;
    _bgCircleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    _bgCircleLayer.fillColor = [UIColor clearColor].CGColor;
    _bgCircleLayer.lineWidth = _strokeWidth;
    
    [self.layer addSublayer:_bgCircleLayer];
    
    if (_isAnimation) {
        [self addShowPercentLayer];
        [self percentAnimation];
    }
    else {
        [self addShowPercentLayer];
    }
    
}
-(void)addShowPercentLayer
{
    _percentLayer = [CAShapeLayer layer];
    _percentLayer.path = _circlePath.CGPath;
    _percentLayer.strokeColor = _percentColor.CGColor;
    _percentLayer.fillColor = [UIColor clearColor].CGColor;
    _percentLayer.lineWidth = _strokeWidth;
    
    _percentLayer.strokeStart = 0.0f;
    _percentLayer.strokeEnd = _persentShow;
    
    [self.layer addSublayer:_percentLayer];
}
-(void)percentAnimation
{
    CABasicAnimation *strokeEndAnimation = nil;
    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 2.0f;
    strokeEndAnimation.fromValue = @(0.0f);
    strokeEndAnimation.toValue = @(_persentShow);
    strokeEndAnimation.autoreverses = NO; //无自动动态倒退效果
    strokeEndAnimation.delegate = self;
    
    [_percentLayer addAnimation:strokeEndAnimation forKey:@"strokeEnd"];
}
//等动画结束之后的操作
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
//    if (flag) {
//        _percentLayer.strokeEnd = _persentShow;
//    }
    NSLog(@"动画结束干点什么好呢");
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
