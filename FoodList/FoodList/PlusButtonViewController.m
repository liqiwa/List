//
//  PlusButtonViewController.m
//  
//
//  Created by 王琳琳 on 17/5/9.
//
//

#import "PlusButtonViewController.h"
#import "LeaveTwoViewController.h"
#import "LeaveLabel.h"
@interface PlusButtonViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)LeaveLabel *foodLabel;
@end

@implementation PlusButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popubView.layer.cornerRadius = 10.0f;
    [self addFoodLabel];
    //父视图不影响子视图的透明度。
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
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
//添加一级类的菜品信息，或者多种类别的信息。


- (IBAction)close:(id)sender{
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
//点击label框中的一级分类，来显示二级View类中的值。
- (void)addFoodLabel{
    CGFloat labelx = 8;
    CGFloat labely = 38;
    CGFloat with = 80;
    CGFloat height = 30;
    NSArray * namearry = [NSArray arrayWithObjects:@"高筋面粉",@"高筋面粉",@"高筋面粉",nil];
    for (int i = 1; i< 7; i+=2) {
        CGFloat newx  = with*i +labelx ;
        //自定义label格式
        LeaveLabel *label = [[LeaveLabel alloc]initWithFrame:CGRectMake(newx, labely, with, height)];
       int randomIndex =  arc4random()%3;
        label.text = namearry[randomIndex];
        [self.popubView addSubview:label];
    }
    
}
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
