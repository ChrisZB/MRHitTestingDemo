//
//  ViewController.m
//  MRHit-testingDemo
//
//  Created by BloodSugar on 2017/4/21.
//  Copyright © 2017年 OFweek. All rights reserved.
//

#import "ViewController.h"
#import "RespondView.h"
#import "SpreadButton.h"
#import "SpreadView.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width

#define RGBCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self hitTest];
    
    //扩大按钮点击范围
//    [self buttonRespondArea];
    
    //子试图超出父试图
    [self subViewOverSuperViewRespond];
}

- (void)hitTest {
    
    RespondView *viewA = [[RespondView alloc] initWithFrame:CGRectMake(20, 70, screenWidth-20, 300)];
    viewA.name = @"viewA";
    viewA.backgroundColor = RGBCOLOR(225,225,225,1);
    [self.view addSubview:viewA];
    
    RespondView *viewB = [[RespondView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(viewA.frame)+10, screenWidth-20, 300)];
    viewB.name = @"viewB";
    viewB.backgroundColor = RGBCOLOR(225,225,225,1);
    [self.view addSubview:viewB];
    
    RespondView *viewC = [[RespondView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    viewC.name = @"viewC";
    viewC.backgroundColor = RGBCOLOR(193,193,193,1);
    [viewA addSubview:viewC];
    
    RespondView *viewD = [[RespondView alloc] initWithFrame:CGRectMake(50, 50, 150, 80)];
    viewD.name = @"viewD";
    viewD.backgroundColor = RGBCOLOR(144,144,144,1);
    [viewB addSubview:viewD];
    
    RespondView *viewE = [[RespondView alloc] initWithFrame:CGRectMake(50, 160, 150, 80)];
    viewE.name = @"viewE";
    viewE.backgroundColor = RGBCOLOR(144,144,144,1);
    [viewB addSubview:viewE];
}

- (void)buttonRespondArea {
    UIView *viewA = [[UIView alloc] initWithFrame:CGRectMake(20, 70, screenWidth-40, 200)];
    viewA.backgroundColor = RGBCOLOR(225,225,225,1);
    [self.view addSubview:viewA];
    
    UIButton *normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    normalBtn.backgroundColor = [UIColor magentaColor];
    [normalBtn setTitle:@"n" forState:UIControlStateNormal];
    normalBtn.frame = CGRectMake(20, 85, 30, 30);
    [viewA addSubview:normalBtn];
    [normalBtn addTarget: self action:@selector(normalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    SpreadButton *spreadBtn = [SpreadButton buttonWithType:UIButtonTypeCustom];
    spreadBtn.minimumHitTestWidth = 100;
    spreadBtn.minimumHitTestHight = 100;
    spreadBtn.backgroundColor = [UIColor magentaColor];
    [spreadBtn setTitle:@"s" forState:UIControlStateNormal];
    spreadBtn.frame = CGRectMake(screenWidth-70-100, 85, 30, 30);
    [viewA addSubview:spreadBtn];
    [spreadBtn addTarget: self action:@selector(customButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)subViewOverSuperViewRespond {
    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(20, 400, screenWidth-40, 30)];
    viewB.backgroundColor = RGBCOLOR(225,225,225,1);
    [self.view addSubview:viewB];
    
    UIButton *normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    normalBtn.backgroundColor = [UIColor magentaColor];
    [normalBtn setTitle:@"n" forState:UIControlStateNormal];
    normalBtn.frame = CGRectMake(20, -30, 60, 60);
    [viewB addSubview:normalBtn];
    [normalBtn addTarget: self action:@selector(normalOverAction) forControlEvents:UIControlEventTouchUpInside];
    
    SpreadView *viewC = [[SpreadView alloc] initWithFrame:CGRectMake(20, 550, screenWidth-40, 30)];
    viewC.backgroundColor = RGBCOLOR(225,225,225,1);
    [self.view addSubview:viewC];
    
    SpreadButton *spreadBtn = [SpreadButton buttonWithType:UIButtonTypeCustom];
    spreadBtn.minimumHitTestWidth = 100;
    spreadBtn.minimumHitTestHight = 100;
    spreadBtn.backgroundColor = [UIColor magentaColor];
    [spreadBtn setTitle:@"s" forState:UIControlStateNormal];
    spreadBtn.frame = CGRectMake(120, -30, 60, 60);
    [viewC addSubview:spreadBtn];
    [spreadBtn addTarget: self action:@selector(customOverAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)normalButtonAction {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了普通按钮" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)customButtonAction {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了扩展按钮" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)normalOverAction {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"NormalOverAction" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)customOverAction {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"CustomOverAction" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
