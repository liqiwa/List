//
//  UIImage+Extension.h
//  
//
//  Created by 王琳琳 on 17/5/4.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)imageName;
+ (UIImage *)resizableImageWithName:(NSString *)imageName;
- (UIImage *)scaleImageWithSize:(CGSize)size;
@end
