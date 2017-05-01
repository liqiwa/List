//
//  LeaveTwo.h
//  
//
//  Created by 王琳琳 on 17/5/1.
//
//

#import <Foundation/Foundation.h>
#import "LeaveOne.h"
@interface LeaveTwo : NSObject
@property (nonatomic)NSUInteger leTwoId;
@property (nonatomic,strong)NSString *leTwoName;
@property (nonatomic,strong)LeaveOne *leaveOne;
@end
