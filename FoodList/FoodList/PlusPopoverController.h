//
//  PlusPopoverControlller.h
//  
//
//  Created by 王琳琳 on 17/5/5.
//
//

#import <UIKit/UIKit.h>

@interface PlusPopoverController : UIPopoverController<UITabBarDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tabView;
@end
