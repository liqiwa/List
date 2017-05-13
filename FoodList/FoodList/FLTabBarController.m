//
//  DSTabBarController.m
//  DSLolita
//
//  Created by 赛 丁 on 15/5/25.
//  Copyright (c) 2015年 samDing. All rights reserved.
//

#import "FLTabBarController.h"
#import "LeftViewController.h"
#import "ListViewController.h"
#import "TotalViewController.h"
#import "FinishViewController.h"
#import "FLNavigationController.h"
#import "PlusTabBarView.h"
#import "ListViewController.h"
#import "FinishViewController.h"
#import "PlusButtonViewController.h"
#import "PlusTabBarView.h"
@interface FLTabBarController () <PlusTabBarViewDelegate>
@property (nonatomic, strong) PlusTabBarView *tabBarView;
@property (nonatomic, strong) UIViewController *vc;
@end

@implementation FLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    // 自定义tabBarView
    [self setupTabBarView];
    
    // 初始化所有子控制器
    [self setupAllChildViewControllers];
}

//- (void)openClient{
//    AVUser *currentUser = [AVUser currentUser];
//    [DSCache registerUser:currentUser];
//    DSIM *im = [DSIM sharedInstance];
//    WEAKSELF
//    [DSUtils showNetworkIndicator];
//    [DSIMConfig config].userDelegate = [DSIMService shareInstance];
//    [im openWithClientId:currentUser.objectId callback:^(BOOL succeeded , NSError *error){
//        [DSUtils hideNetworkIndicator];
//        
//    }];
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  自定义tabBarView
 */
- (void)setupTabBarView
{
    PlusTabBarView *tabBarView = [[PlusTabBarView alloc] init];
    tabBarView.frame = self.tabBar.bounds;
    tabBarView.delegate = self;
    [self.tabBar addSubview:tabBarView];
    self.tabBarView = tabBarView;
}


//创建自定义tabbar
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    for (UIView *child in self.tabBar.subviews) {
//        if ([child isKindOfClass:[UIControl class]]) {
//            [child removeFromSuperview];
//        }
//    }
////}
//- (void)addCustomTabBar {
//    
//    //创建自定义tabbar
//    PlusTabBarView *customTabBar = [[PlusTabBarView alloc] init];
//    customTabBar.tabBarViewDelegate = self;
//    
//    //更换系统自带的tabbar
//    [self setValue:customTabBar forKey:@"tabBar"];
//}


/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    //childVc.view.backgroundColor = DSRandomColor;
    
    //设置标题
    childVc.title = title;
  
    
    //设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //设置选中图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        //声明这张图用原图
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //添加导航控制器
    FLNavigationController *nav = [[FLNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    
}
/**
 *  删除自带按钮
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
/**
 *  初始化所有子控制器
 */
- (void)setupAllChildViewControllers
{
    ListViewController *home = [[ListViewController alloc] init];
    //home.tabBarItem.badgeValue = @"2";
    [self setupChildViewController:home title:@"首页"
                         imageName:@"tabbar_home"
                 selectedImageName:@"tabbar_home_selected"];
    
    FinishViewController *message = [[FinishViewController alloc] init];
    //message.tabBarItem.badgeValue = @"16";
    [self setupChildViewController:message title:@"消息"
                         imageName:@"tabbar_message_center"
                 selectedImageName:@"tabbar_message_center_selected"];
    
    //    XXDiscoverViewController *discover = [[XXDiscoverViewController alloc] init];
    //    discover.tabBarItem.badgeValue = @"new";
    //    self.vc = discover;
    //    [self setupChildViewController:discover title:@"发现"
    //                         imageName:@"tabbar_discover"
    //                 selectedImageName:@"tabbar_discover_selected"];
    //
    //    XXMeViewController *me = [[XXMeViewController alloc] init];
    //    [self setupChildViewController:me title:@"我"
    //                         imageName:@"tabbar_profile"
    //                 selectedImageName:@"tabbar_profile_selected"];
}

//
//- (void)addAllChildVcs
//{
//    
//    ListViewController *list = [[ListViewController alloc] init];
//    [self addOneChildVc:list title:@"清单" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
//    
//    FinishViewController *done = [[FinishViewController alloc] init];
//    [self addOneChildVc:done title:@"完成" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
//
//}




// 在iOS7中, 会对selectedImage的图片进行再次渲染为蓝色
// 要想显示原图, 就必须得告诉它: 不要渲染

// Xcode的插件安装路径: /Users/用户名/Library/Application Support/Developer/Shared/Xcode/Plug-ins

/**
 *  默认只调用该功能一次
 */
- (void)setupChildViewController:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 给tabBarItem设置数据
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //添加导航控制器
    FLNavigationController *nav = [[FLNavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
    [self.tabBarView addTabBarButtonWithItem:VC.tabBarItem];

    // 初始化导航控制器
//    XXNavigationController *nav = [[XXNavigationController alloc] initWithRootViewController:VC];
//    [self addChildViewController:nav];
//    
//    // 添加tabBarView内部按钮
//    [self.tabBarView addTabBarButtonWithItem:VC.tabBarItem];
}

+ (void)initialize
{
    //设置底部tabbar的主题样式
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DSCommonColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}


//
//#pragma mark - DSTabBarDelegate
//- (void)tabBarDidClickedPlusButton:(PlusTabBarView *)tabBar
//{
//    NSLog(@"我是加按钮");
//   PlusButtonViewController *plusbuttonVc = [[PlusButtonViewController alloc] initWithNibName:@"PlusButtonViewController" bundle:nil];
//
//    //设置两个VC的图像大小相等。
//    plusbuttonVc.view.frame = self.view.frame;
//    [self.view addSubview:plusbuttonVc.view];
//    [self addChildViewController:plusbuttonVc];
//    [plusbuttonVc didMoveToParentViewController:self];
////    plusVc.modalPresentationStyle = UIModalPresentationFormSheet;
////    plusVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    //[self presentViewController:plusbuttonVc animated:YES completion:nil];
//       //    plusVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//}

- (void)tabBarView:(PlusTabBarView *)tabBarView didSelectedButtonFrom:(int)from to:(int)to
{
    // 切换控制器
    self.selectedIndex = to;
}

- (void)tabBarViewSendStatus:(PlusTabBarView *)tabBarView
{
    NSLog(@"我是加按钮");
    PlusButtonViewController *plusbuttonVc = [[PlusButtonViewController alloc] initWithNibName:@"PlusButtonViewController" bundle:nil];
    
    //设置两个VC的图像大小相等。
    plusbuttonVc.view.frame = self.view.frame;
    [self.view addSubview:plusbuttonVc.view];
    [self addChildViewController:plusbuttonVc];
    [plusbuttonVc didMoveToParentViewController:self];

}


@end
