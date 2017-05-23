//
//  LeaveView.h
//  
//
//  Created by 王琳琳 on 17/5/16.
//
//

#import <UIKit/UIKit.h>
#import "LeaveOne.h"
#import "LeaveTwo.h"
@class LeavePopView;
@protocol LeavePopViewDelegate <NSObject>

-(void)LeavePopViewDelegate:(LeavePopView *)lpvc LabelID:(NSInteger )lbid;

@end
@interface LeavePopView : UIView
@property (nonatomic,weak)id <LeavePopViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame leaveModalArray:(NSMutableArray *)array;
- (id)initWithFrame:(CGRect)frame LeaveTwoModal:(LeaveTwo *)twoModal;
@end
