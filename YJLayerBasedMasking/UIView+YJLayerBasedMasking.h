//
//  UIView+YJLayerBasedMasking.h
//  YJLayerBasedMasking
//
//  Created by huang-kun on 16/9/29.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YJLayerBasedMasking)

/**
 Add a CAShapeLayer on top of UIView to make a circular masking effect.

 @param layerColor The color for the masking layer.
 */
- (void)yj_addCircularShapeLayerWithColor:(UIColor *)layerColor;

/**
 Add a CAShapeLayer on top of UIView to make a circular masking effect.

 @param layerColor  The color for the masking layer.
 @param borderWidth The border width for the circle line.
 @param borderColor The border color for the circle line.
 */
- (void)yj_addCircularShapeLayerWithColor:(UIColor *)layerColor
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor;

/**
 Add a CAShapeLayer on top of UIView to make a rounded corner masking effect.

 @param layerColor   The color for the masking layer.
 @param cornerRadius The corner radius value for masking effect.
 */
- (void)yj_addRoundedCornerShapeLayerWithColor:(UIColor *)layerColor
                                  cornerRadius:(CGFloat)cornerRadius;

/**
 Add a CAShapeLayer on top of UIView to make a rounded corner masking effect.

 @param layerColor   The color for the masking layer.
 @param cornerRadius The corner radius value for masking effect.
 @param borderWidth  The border width for the outer line.
 @param borderColor  The border color for the outer line.
 */
- (void)yj_addRoundedCornerShapeLayerWithColor:(UIColor *)layerColor
                                  cornerRadius:(CGFloat)cornerRadius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
