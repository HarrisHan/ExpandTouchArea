//
//  UIControl+ExpandTouchArea.m
//  Apollon
//
//  Created by Harris on 2017/7/13.
//  Copyright © 2017年 njsqrt3. All rights reserved.
//

static char topKey;
static char leftKey;
static char bottomKey;
static char rightKey;

#import "UIControl+ExpandTouchArea.h"
#import <objc/runtime.h>

@implementation UIControl (ExpandTouchArea)

- (void)expandTouchAreaWithTop:(CGFloat)top left:(CGFloat)left
                        bottom:(CGFloat)bottom right:(CGFloat)right {
    objc_setAssociatedObject(self, &topKey,     [NSNumber numberWithFloat:top],    OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &leftKey,    [NSNumber numberWithFloat:left],   OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &bottomKey,  [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &rightKey,   [NSNumber numberWithFloat:right],  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)expandRect {
    
    NSNumber *top    = objc_getAssociatedObject(self, &topKey);
    NSNumber *left   = objc_getAssociatedObject(self, &leftKey);
    NSNumber *bottom = objc_getAssociatedObject(self, &bottomKey);
    NSNumber *right  = objc_getAssociatedObject(self, &rightKey);
    
    CGFloat x = self.bounds.origin.x;
    CGFloat y = self.bounds.origin.y;
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    return CGRectMake(x - left.floatValue, y - top.floatValue, w + left.floatValue + right.floatValue, h + top.floatValue + bottom.floatValue);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect rect = [self expandRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
