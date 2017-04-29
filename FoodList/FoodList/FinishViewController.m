//
//  SecondViewController.m
//  FoodList
//
//  Created by 王琳琳 on 17/4/28.
//  Copyright (c) 2017年 LiQiwa. All rights reserved.
//

#import "FinishViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerBarButtonItem.h>
#import "LeftViewController.h"
@interface FinishViewController ()
@end

@implementation FinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMDrawerBarButtonItem *leftDrawerButton = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)leftDrawerButtonPress:(id)sender{

    NSLog(@"我点击了按钮");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
