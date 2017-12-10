//
//  UIControl+ExpandTouchArea.h
//  Apollon
//
//  Created by Harris on 2017/7/13.
//  Copyright © 2017年 njsqrt3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ExpandTouchArea)

- (void)expandTouchAreaWithTop:(CGFloat) top
                          left:(CGFloat) left
                        bottom:(CGFloat) bottom
                         right:(CGFloat) right;

@end
