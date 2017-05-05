//
//  NewViewController.m
//  
//
//  Created by 王琳琳 on 17/4/28.
//
//

#import "ListViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerBarButtonItem.h>
#import "LeftViewController.h"
@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MMDrawerBarButtonItem *leftDrawerButton = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    // Do any additional setup after loading the view, typically from a nib.// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftDrawerButtonPress:(id)sender{
    
    NSLog(@"我点击了按钮");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
