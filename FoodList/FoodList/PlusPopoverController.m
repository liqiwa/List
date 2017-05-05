//
//  PlusPopoverControlller.m
//  
//
//  Created by 王琳琳 on 17/5/5.
//
//

#import "PlusPopoverController.h"

@implementation PlusPopoverController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tabcell"];
    }

    return cell;
}
@end
