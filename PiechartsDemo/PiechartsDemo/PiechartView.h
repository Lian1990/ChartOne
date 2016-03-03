//
//  PiechartView.h
//  PiechartsDemo
//
//  Created by LIAN on 16/2/24.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiechartView : UIView

@property (strong,nonatomic) CAShapeLayer *bgCircleLayer;
@property (strong,nonatomic) UIBezierPath *circlePath;

@property (strong,nonatomic) CAShapeLayer *percentLayer;

@property (nonatomic) CGFloat strokeWidth;
@property (strong,nonatomic) UIColor *percentColor;
@property (nonatomic) CGFloat persentShow;

@property BOOL isAnimation;

-(id)initWithFrame:(CGRect)frame withStrokeWidth:(CGFloat )width andColor:(UIColor *)color andPercent:(CGFloat)percent andAnimation:(BOOL) animation;

@end
