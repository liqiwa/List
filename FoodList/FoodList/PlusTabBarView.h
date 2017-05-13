//
//  PlusTabbar.h
//  
//
//  Created by 王琳琳 on 17/5/3.
//
//

#import <UIKit/UIKit.h>
//添加自定义tabbar，增加+按钮效果，确定位置和图片等信息
@class PlusTabBarView;

@protocol PlusTabBarViewDelegate <NSObject>

@optional


- (void)tabBarView:(PlusTabBarView *)tabBarView didSelectedButtonFrom:(int)from to:(int)to;

- (void)tabBarViewSendStatus:(PlusTabBarView *)tabBarView;
@end
@interface PlusTabBarView : UIView
@property (nonatomic,weak)id<PlusTabBarViewDelegate> delegate;
/**
 *  添加按钮
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
