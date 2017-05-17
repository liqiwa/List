//
//  LeaveView.m
//  
//
//  Created by 王琳琳 on 17/5/16.
//
//

#import "LeavePopView.h"
#import "LeaveLabel.h"
#import "LeaveOne.h"
#import "LeaveTwo.h"
@implementation LeavePopView

- (id)initWithFrame:(CGRect)frame LeaveOneModal:(LeaveOne *)oneModal{

    //如何设置view处于view的中心，最好长方形。
    self = [super initWithFrame:frame];
    if (self) {
        float labelX = frame.size.width;
        float labelwidth = frame.size.width;
        float labelY = frame.size.height;
        //添加数组，来判断，每个label循环添加到视图上面。
        for (<#initialization#>; <#condition#>; <#increment#>) {
            <#statements#>
        }
        LeaveLabel *label =[[LeaveLabel alloc] initWithFrame:(CGRectMake(i*labelX/4, 0,labelwidth/4, 30))];
        
    }
    
    return self;
}
- (id)initWithFrame:(CGRect)frame LeaveTwoModal:(LeaveTwo *)twoModal{

    
    return self;

}
@end
