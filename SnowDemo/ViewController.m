//
//  ViewController.m
//  SnowDemo
//
//  Created by liuwei on 16/10/14.
//  Copyright © 2016年 liuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) UIImage *image;
@end

@implementation ViewController
#define screen_Width  [UIScreen mainScreen].bounds.size.width
#define screen_Height [UIScreen mainScreen].bounds.size.height
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    self.image = [UIImage imageNamed:@"snow"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)timeAction
{
   
  
    UIImageView * imgView = [[UIImageView alloc]initWithImage:self.image];
   
    imgView.alpha = 0.8;
    
    int routeCount = round(random()%10);//雪花旋转的圈数
    
    float x = round(random()%(int)screen_Width);//x坐标随机
    int yx = round(random()%(int)screen_Width);
    int s = round(random()%50)+10;//雪花图片的大小
    int sp = 1/round(random()%100)+1;//速度
    imgView.frame = CGRectMake(x, -60, s, s);
    [self.view addSubview:imgView];
    
//    [self startAnimation:imgView];
    
    [UIView animateWithDuration:10*sp animations:^{
        
        imgView.frame = CGRectMake(yx, screen_Height, s, s);
        [self startAnimation:imgView];
    }completion:^(BOOL finished) {
        imgView.hidden = YES;
        [imgView removeFromSuperview];
    }];
}

- (void)startAnimation:(UIImageView *)imgView
{
    __block double angle = round(random()%360);
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 360.0f));
    [UIView animateWithDuration:0.2 delay:0 options:nil animations:^{
        imgView.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 10;
        [self startAnimation:imgView];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
