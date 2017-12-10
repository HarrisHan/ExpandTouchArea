//
//  ViewController.m
//  ExpandTouchArea
//
//  Created by Harris on 2017/12/10.
//  Copyright © 2017年 Harris. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+ExpandTouchArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton new];
    
    [btn expandTouchAreaWithTop:10 left:10 bottom:10 right:10];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
