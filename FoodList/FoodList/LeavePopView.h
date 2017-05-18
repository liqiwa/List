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
@interface LeavePopView : UIView
- (id)initWithFrame:(CGRect)frame leaveModalArray:(NSMutableArray *)array;
- (id)initWithFrame:(CGRect)frame LeaveTwoModal:(LeaveTwo *)twoModal;
@end
