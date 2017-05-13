//
//  LeaveLabel.m
//  
//
//  Created by 王琳琳 on 17/5/13.
//
//

#import "LeaveLabel.h"

@implementation LeaveLabel


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
    self.backgroundColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"System-Light" size:16];
        
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.frame = frame;
    }
    return self;
}
@end
