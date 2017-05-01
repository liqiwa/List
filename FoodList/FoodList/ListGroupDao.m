//
//  ListGroupDao.m
//  
//
//  Created by 王琳琳 on 17/5/1.
//
//

#import "ListGroupDao.h"
#import "ListGroup.h"
@implementation ListGroupDao
NSString *dbName = @"app.sqlite";
sqlite3 *database = nil;
- (BOOL)open{
    NSArray *dbFloderPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *dbFilePath = [[dbFloderPath objectAtIndex:0] stringByAppendingString:dbName];
    return (sqlite3_open([dbFilePath UTF8String], &database) == SQLITE_OK);
}
- (void)close{

    if (database != nil) {
        sqlite3_close(database);
    }
}
- (void)initialized{

    char *errorMsg;
    if (database!=nil) {
        const char *createSQL = [@"drop table if exists ListGroup; create table ListGroup (groupID INTEGER  primary key autoincrement not null,groupName  VARCHAR(20)  not null,groupRemainNumber INTEGER);" UTF8String];
        if (sqlite3_exec(database, createSQL, NULL, NULL, &errorMsg) != SQLITE_OK) {
            NSLog(@"errorMsg: %s",errorMsg);
            sqlite3_free(errorMsg);
        }
        
    }
}
- (void)insertData{

    char *errorMsg;
    NSString *name = @"菜单";
    NSUInteger number = 10;
    if (database != nil) {
        NSString *sqlString = [NSString stringWithFormat:@"insert into ListGroup(groupName,groupRemainNumber)values('%@','%ld')",name,number];
        const char *insertSQL = [sqlString UTF8String];
        if (sqlite3_exec(database,insertSQL, NULL, NULL, &errorMsg) != SQLITE_OK) {
            NSLog(@"error: %s",errorMsg);
            sqlite3_free(errorMsg);
        }

        
    }

}
- (NSArray *)selectData{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    ListGroup *listGp = [[ListGroup alloc] init];
    if (database != nil) {
        sqlite3_stmt *statement = nil;
        const char *selectSQL = [@"select * from ListGroup" UTF8String];
        if (sqlite3_prepare_v2(database, selectSQL, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *data = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement,1)];
                [dataArray addObject:data];
                //转换成对象属性
            }
        }
        sqlite3_finalize(statement);
    }
    
    return [NSArray arrayWithArray:dataArray];
    
}
@end
