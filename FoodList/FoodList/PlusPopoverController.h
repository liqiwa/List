//
//  PlusPopoverControlller.h
//  
//
//  Created by 王琳琳 on 17/5/5.
//
//

#import <UIKit/UIKit.h>
@class PlusPopoverController;
@protocol PlusPopoverControllerDelegate

-(NSString *)PlusPopoverController:(PlusPopoverController *)pvc choiceLevelName:(NSString *)name;
@end
@interface PlusPopoverController : UIViewController
@property (nonatomic,weak)id<PlusPopoverControllerDelegate> delegate;
@end
