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
#import "PlusTabBar.h"
#import "ListViewController.h"
#import "FinishViewController.h"
#import "PlusPopoverController.h"
@interface FLTabBarController () <PlusTabBarDelegate,PlusPopoverControllerDelegate>

@end

@implementation FLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加所有的自控制器
    [self addAllChildVcs];
    
    //2.创建自定义tabbar
    [self addCustomTabBar];
    
    //3.设置用户信息为读书 （利用定时器获取用户未读数）
//    [self getUnreadCount];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getUnreadCount) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    
//    [self openClient];
//    
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


//创建自定义tabbar

- (void)addCustomTabBar {
    
    //创建自定义tabbar
    PlusTabBar *customTabBar = [[PlusTabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    
    //更换系统自带的tabbar
    [self setValue:customTabBar forKey:@"tabBar"];
}


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


- (void)addAllChildVcs
{
    
    ListViewController *list = [[ListViewController alloc] init];
    [self addOneChildVc:list title:@"清单" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    FinishViewController *done = [[FinishViewController alloc] init];
    [self addOneChildVc:done title:@"完成" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
//    TotalViewController *total = [[TotalViewController alloc] init];
//    [self addOneChildVc:total title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
//
//    TotalViewController *total1 = [[TotalViewController alloc] init];
//    [self addOneChildVc:total1 title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
}




// 在iOS7中, 会对selectedImage的图片进行再次渲染为蓝色
// 要想显示原图, 就必须得告诉它: 不要渲染

// Xcode的插件安装路径: /Users/用户名/Library/Application Support/Developer/Shared/Xcode/Plug-ins

/**
 *  默认只调用该功能一次
 */

+ (void)initialize
{
    //设置底部tabbar的主题样式
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DSCommonColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}



#pragma mark - DSTabBarDelegate
- (void)tabBarDidClickedPlusButton:(PlusTabBar *)tabBar
{
       
    NSLog(@"我是加按钮");
   
    PlusPopoverController *plusVc = [[PlusPopoverController alloc] initWithStyle:UITableViewStylePlain];
    //plusVc.delegate = self;
    plusVc.modalPresentationStyle = UIModalPresentationFormSheet;
    plusVc.view.superview.frame = CGRectMake(0, 0, 430, 383);
    plusVc.view.superview.center = CGPointMake(1024/2, 748/2);
    [self presentViewController:plusVc animated:YES completion:nil];
   
   
//    plusVc.preferredContentSize = CGSizeMake(self.view.frame.size.width / 2,self.view.frame.size.height/ 2);
//    // 弹出发微博控制器
//    DSComposeViewController *compose = [[DSComposeViewController alloc] init];
//    compose.source = @"compose";
//    compose.homeVc = self.homeViewController;
//    DSNavigationController *nav = [[DSNavigationController alloc] initWithRootViewController:compose];
   // [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark - PlusPopoverDelegate
- (NSString *)PlusPopoverController:(PlusPopoverController *)pvc choiceLevelName:(NSString *)name{
    

    return @"woso";
    
    
}



@end
