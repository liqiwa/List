//
//  ListItem.h
//  
//
//  Created by 王琳琳 on 17/5/1.
//
//

#import <Foundation/Foundation.h>
#import "ProductUnit.h"
#import "ListGroup.h"
#import "LeaveTwo.h"
@interface ListItem : NSObject
@property (nonatomic)NSUInteger itemId;
@property (nonatomic,strong)NSString *itemName;
@property (nonatomic)BOOL itemState;
@property (nonatomic)NSInteger itemNumber;
@property (nonatomic,strong)NSDate *itemDate;
@property (nonatomic,strong)ProductUnit *proUnit;
@property (nonatomic,strong)ListGroup *listGroup;
@property (nonatomic,strong)LeaveTwo *leTwo;
@end
