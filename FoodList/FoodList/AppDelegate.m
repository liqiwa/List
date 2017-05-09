//
//  AppDelegate.m
//  FoodList
//
//  Created by 王琳琳 on 17/4/28.
//  Copyright (c) 2017年 LiQiwa. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"
#import "FinishViewController.h"
#import "TotalViewController.h"
#import <MMDrawerController/MMDrawerController.h>
#import "LeftViewController.h"
#import "ListGroupDao.h"
#import "FLTabBarController.h"
#import "PlusButtonViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong)MMDrawerController *drawerCtr;
@end

@implementation AppDelegate

- (void)initRootVC{
    //仿微博新建页面的 分页展示，1将类别进行罗列，包括大类。尽量可选择。
//    ListViewController *VC1 = [[ListViewController alloc] init];
//    UINavigationController *nv1 = [[UINavigationController alloc] initWithRootViewController:VC1];
//    
//    FinishViewController *VC2 = [[FinishViewController alloc] init];
//    UINavigationController *nv2 = [[UINavigationController alloc] initWithRootViewController:VC2];
//    
//    TotalViewController *VC3 = [[TotalViewController alloc] init];
//    UINavigationController *nv3 = [[UINavigationController alloc] initWithRootViewController:VC3];
//    
//   // MMDrawerController *drawerController2 = []
//    //将新建改成图标，点击会有反应
//    VC1.title = @"新建";
//    VC2.title = @"清单";
//    VC3.title = @"统计";
//      NSArray *viewCtrs =@[nv2,nv1,nv3];
//    
//    self.rootTabbar = [[UITabBarController alloc] init];
//       [self.rootTabbar setViewControllers:viewCtrs animated:YES];
//   //改变tabbarCtr的默认页面索引
//    //self.rootTabbar.selectedIndex = 1;
//   
//    
////    [self.drawerCtr setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
////        
////        MMDrawerControllerDrawerVisualStateBlock block;
////        block = [[MMExampleDrawerVisualStateManager sharedManager]
////                 drawerVisualStateBlockForDrawerSide:drawerSide];
////        if(block){
////            block(drawerController, drawerSide, percentVisible);
////        }
////        
////    }];
    FLTabBarController *rootTabbar = [[FLTabBarController alloc] init];
    LeftViewController *leftDrawer = [[LeftViewController alloc] init];
    self.drawerCtr = [[MMDrawerController alloc]initWithCenterViewController:rootTabbar
                                                    leftDrawerViewController:leftDrawer];
    [self.drawerCtr setShowsShadow:NO];
    [self.drawerCtr setMaximumLeftDrawerWidth:kScreenWidth-100];
    /**
     关闭侧滑手势，当plusbutton显示leave时就可以调用此方法来禁止侧滑
     [self.drawerCtr setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
     
     */
    PlusButtonViewController *plusVC = [[PlusButtonViewController alloc] init];
    plusVC.mmCtr = self.drawerCtr;
    [self.drawerCtr setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerCtr setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    //整个视图的rootview应该是mmdrawerviewcontroller
    self.window.rootViewController = self.drawerCtr;
    
    
    //为各图标添加图片
    
    

}
- (void)initListGroupData{
    ListGroupDao *listdb = [[ListGroupDao alloc] init];
    [listdb open];
    [listdb initialized];
    [listdb insertData];
    [listdb close];

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Overr ide point for customization after application launch.
    
    [self initRootVC];
    [self initListGroupData];
   
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
