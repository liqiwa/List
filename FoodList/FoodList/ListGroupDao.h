//
//  ListGroupDao.h
//  
//
//  Created by 王琳琳 on 17/5/1.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface ListGroupDao : NSObject

- (BOOL)open;
- (void)close;
- (void)initialized;
- (void)insertData;
- (NSArray *)selectData;
@end
