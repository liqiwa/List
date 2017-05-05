//
//  PlusTabbar.h
//  
//
//  Created by 王琳琳 on 17/5/3.
//
//

#import <UIKit/UIKit.h>
//添加自定义tabbar，增加+按钮效果，确定位置和图片等信息
@class PlusTabBar;

@protocol PlusTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(PlusTabBar *)tabBar;

@end
@interface PlusTabBar : UITabBar
@property (nonatomic,weak) id<PlusTabBarDelegate> tabBarDelegate;
@end
