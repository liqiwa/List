//
//  LeveTwoViewController.m
//  
//
//  Created by 王琳琳 on 17/5/9.
//
//

#import "LeaveTwoViewController.h"

@interface LeaveTwoViewController ()

@end

@implementation LeaveTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 10.0f;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backVC:(id)sender{

    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];

}
//选择菜品，然后确定，添加到购买清单中。使用通知进行菜品添加。


@end
