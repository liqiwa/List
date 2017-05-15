//
//  LeaveLabel.h
//  
//
//  Created by 王琳琳 on 17/5/13.
//
//

#import <UIKit/UIKit.h>
@class LeaveLabel;
@protocol LeaveLabelDelegate <NSObject>

-(void *)LeaveLabel:(LeaveLabel *)label 

@end
@interface LeaveLabel : UILabel

@end
