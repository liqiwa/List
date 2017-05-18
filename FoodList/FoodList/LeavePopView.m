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

- (id)initWithFrame:(CGRect)frame leaveModalArray:(NSMutableArray *)array{

    //如何设置view处于view的中心，最好长方形。
    self = [super initWithFrame:frame];
    if (self) {
        //CGRectMake(2, 127, 369, 432);
        self.frame =frame;
        self.layer.cornerRadius = 10.f;
        self.backgroundColor = [UIColor whiteColor];
        float labelX = self.frame.size.width;
        float labelwidth = self.frame.size.width;
        float newX = 0;
    //添加数组，来判断，每个label循环添加到视图上面。
        for (int i = 0; i < array.count; i++) {
            if (i<4) {
                newX = i*labelX/4+8 ;
                 LeaveOne *leavemodal = array[i];
                 LeaveLabel *label =[[LeaveLabel alloc] initWithFrame:(CGRectMake(newX, 8,labelwidth/5, 30))];
                label.text = leavemodal.leaveOneName;
                label.tag = leavemodal.leaveOndId;
                NSLog(@"xxxx %ld",label.tag);
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taptouch:)];
                [label addGestureRecognizer:tap];
                label.userInteractionEnabled = YES;
                [self addSubview:label];
            }
//            else if (i < 5){
//            
//                
//            }
            
        }
       
        
    }
    
    return self;
}
//代理方法，需要plusbuttonvc执行，然后进行子类页面的切换。
- (void)taptouch:(UITapGestureRecognizer *)sender
{

    NSLog(@"label Id is %ld",sender.view.tag);
}
- (id)initWithFrame:(CGRect)frame LeaveTwoModal:(LeaveTwo *)twoModal{

    
    return self;

}
@end
