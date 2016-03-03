//
//  ViewController.m
//  PiechartsDemo
//
//  Created by LIAN on 16/2/24.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "ViewController.h"
#import "PiechartView.h"
#import "PiechartDetchView.h"

#import "PiechartModel.h"

@interface ViewController ()

@property (strong,nonatomic) PiechartView *chartOne;
@property (strong,nonatomic) PiechartDetchView *chartTwo;

@property (strong,nonatomic) UIView *bgView;

@end

@implementation ViewController


@synthesize bgView = _bgView;
@synthesize chartOne = _chartOne;
@synthesize chartTwo = _chartTwo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buttonBuild];
//    [self buildChartOne];
//    [self buildChartDetailDetch];
    
}
-(void)buttonBuild
{
    
    NSArray *btnName = @[@"单一环",@"整环"];
    for (int i=0 ; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(50, 400 +i*35, 60, 30);
        btn.tag = i+200;
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:[btnName objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
-(void)btnClick:(id)sender
{
    if (_bgView) {
        [_bgView removeFromSuperview];
    }
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 320)];
    _bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgView];

  
    
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 200) {
        [self buildChartOne];
    }
    else if (btn.tag == 201)
    {
        [self buildChartDetailDetch];
    }
    
}
-(void)buildChartOne
{
    _chartOne = [[PiechartView alloc]initWithFrame:CGRectMake(40, 50, [UIScreen mainScreen].bounds.size.width-100, 300) withStrokeWidth:50 andColor:[UIColor blueColor] andPercent:0.8f andAnimation:YES];
//    _chartOne.backgroundColor = [UIColor greenColor];
    [_bgView addSubview:_chartOne];
}

-(void)buildChartDetailDetch
{
    PiechartModel *model1 = [[PiechartModel alloc]init];
    model1.color = [UIColor redColor];
    model1.perStr = @"0.3";
    
    PiechartModel *model2 = [[PiechartModel alloc]init];
    model2.color = [UIColor blueColor];
    model2.perStr = @"0.4";
    
    PiechartModel *model3 = [[PiechartModel alloc]init];
    model3.color = [UIColor greenColor];
    model3.perStr = @"0.3";
    
    NSArray *testArray = [NSArray arrayWithObjects:model1,model2,model3, nil];
    
    _chartTwo = [[PiechartDetchView alloc]initWithFrame:CGRectMake(70, 30, [UIScreen mainScreen].bounds.size.width-140, 300) withStrokeWidth:90 andColor:[UIColor redColor] andPerArray:testArray  andAnimation:YES];
    [_bgView addSubview:_chartTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
