//
//  PlusButtonViewController.m
//  
//
//  Created by 王琳琳 on 17/5/9.
//
//

#import "PlusButtonViewController.h"
#import "LeaveTwoViewController.h"
@interface PlusButtonViewController ()<UIGestureRecognizerDelegate>
@end

@implementation PlusButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popubView.layer.cornerRadius = 10.0f;
    //增加手势来判断，如果点击view之外的地方直接关闭。
    UITapGestureRecognizer *gestureRecognizer =
                    [[UITapGestureRecognizer alloc]initWithTarget:self
                                                        action:@selector(close:)];
    gestureRecognizer.cancelsTouchesInView = NO;
    gestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:gestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return (touch.view == self.view);

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
- (IBAction)close:(id)sender{
    //激活MMDR侧滑方法
    [self.mmCtr setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
//点击label框中的一级分类，来显示二级View类中的值。
//从数据库得到具体label数量。排序拍到view显示
//根据
- (IBAction)pushLeaveTwoVc:(id)sender{
    LeaveTwoViewController *letwoVc = [[LeaveTwoViewController alloc] initWithNibName:@"LeaveTwoViewController" bundle:nil];
    [self.view addSubview:letwoVc.view];
    letwoVc.view.center= self.view.center  ;
    [self addChildViewController:letwoVc];
    [letwoVc didMoveToParentViewController:self];

    //[self presentViewController:letwoVc animated:YES completion:nil];
}
@end
