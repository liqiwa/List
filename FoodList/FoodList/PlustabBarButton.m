//
//  PlusPopoverControlller.m
//  
//
//  Created by 王琳琳 on 17/5/5.
//
//

#import "PlustabBarButton.h"
#import "PlustabBarButton.h"

// 内部图片所占比例
#define TabBarButtonImageRatio 0.7
// 内部文字大小
#define TabBarButtonTitleSize 10.0

// 文字颜色
#define TabBarButtonTitleColor Color(117, 117, 117)
#define TabBarButtonTitleSelColor Color(234, 103, 7)

@interface PlustabBarButton ()
/**
 *  提醒数字按钮
 */

@end

@implementation PlustabBarButton

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置内部图片和文字格式
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:TabBarButtonTitleSize];
        [self setTitleColor:TabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:TabBarButtonTitleSelColor forState:UIControlStateSelected];
        
//        // 添加提醒数字按钮
//        XXBadgeButton *badgeButton = [[XXBadgeButton alloc] init];
//        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
//        [self addSubview:badgeButton];
//        self.badgeButton = badgeButton;
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO 监听item属性的改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

/**
 *  监听到某个对象的属性值改变了 就会调用
 *
 *  @param keyPath 属性名
 *  @param object  对象名
 *  @param change  属性的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置badgeValue
   // self.badgeButton.badgeValue = self.item.badgeValue;
    
//    // 设置提醒数字按钮frame
//    CGRect frame = self.badgeButton.frame;
//    CGFloat badgeX = self.frame.size.width - frame.size.width - 3;
//    CGFloat badgeY = 2;
//    frame.origin.x = badgeX;
//    frame.origin.y = badgeY;
//    self.badgeButton.frame = frame;
}

#pragma mark - 重置按钮格式

// 去除按钮高亮状态
- (void)setHighlighted:(BOOL)highlighted {}

// 重写内部图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * TabBarButtonImageRatio;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 重写内部文字frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * TabBarButtonImageRatio - 5;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
