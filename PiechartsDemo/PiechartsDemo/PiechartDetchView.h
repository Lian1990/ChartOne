//
//  PiechartDetchView.h
//  PiechartsDemo
//
//  Created by LIAN on 16/2/25.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiechartDetchView : UIView

@property (strong,nonatomic) CAShapeLayer *bgCircleLayer;
@property (strong,nonatomic) UIBezierPath *circlePath;

@property (strong,nonatomic) CAShapeLayer *percentLayer;

@property (nonatomic) CGFloat strokeWidth;
@property (strong,nonatomic) UIColor *percentColor;

@property (strong,nonatomic) NSArray *perArray;
@property (strong,nonatomic) NSMutableArray *layerArray;

@property BOOL isAnimation;

-(id)initWithFrame:(CGRect)frame withStrokeWidth:(CGFloat )width andColor:(UIColor *)color andPerArray:(NSArray *)perArray andAnimation:(BOOL) animation;

@end
