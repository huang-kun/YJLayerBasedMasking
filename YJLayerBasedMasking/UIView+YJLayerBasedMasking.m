//
//  UIView+YJLayerBasedMasking.m
//  YJLayerBasedMasking
//
//  Created by huang-kun on 16/9/29.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "UIView+YJLayerBasedMasking.h"
#import "CAShapeLayer+YJLayerBasedMasking.h"

@implementation UIView (YJLayerBasedMasking)

- (void)yj_addCircularShapeLayerWithColor:(UIColor *)layerColor {
    [self yj_addCircularShapeLayerWithColor:layerColor borderWidth:0.0 borderColor:[UIColor clearColor]];
}

- (void)yj_addCircularShapeLayerWithColor:(UIColor *)layerColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor  {

    CGFloat onePixelInPoint = 1 / UIScreen.mainScreen.scale;
    CGSize size = (CGSize){ self.bounds.size.width + onePixelInPoint * 2, self.bounds.size.height + onePixelInPoint * 2 };
    
    CAShapeLayer *circleLayer = [CAShapeLayer yj_circularMaskLayerInSize:size fillColor:layerColor.CGColor strokeWidth:borderWidth strokeColor:borderColor.CGColor];
    
    CALayer *topLayer = self.layer.sublayers.lastObject;
    if ([topLayer isKindOfClass:[CAShapeLayer class]]) {
        [topLayer removeFromSuperlayer];
    }
    [self.layer addSublayer:circleLayer];
    
    circleLayer.position = (CGPoint){ -onePixelInPoint, -onePixelInPoint };
}

- (void)yj_addRoundedCornerShapeLayerWithColor:(UIColor *)layerColor cornerRadius:(CGFloat)cornerRadius {
    [self yj_addRoundedCornerShapeLayerWithColor:layerColor cornerRadius:cornerRadius borderWidth:0.0 borderColor:[UIColor clearColor]];
}

- (void)yj_addRoundedCornerShapeLayerWithColor:(UIColor *)layerColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {

    CGFloat onePixelInPoint = 1 / UIScreen.mainScreen.scale;
    CGSize size = (CGSize){ self.bounds.size.width + onePixelInPoint * 2, self.bounds.size.height + onePixelInPoint * 2 };
    
    CAShapeLayer *roundedCornerLayer = [CAShapeLayer yj_roundedRectMaskLayerInSize:size cornerRadius:cornerRadius fillColor:layerColor.CGColor strokeWidth:borderWidth strokeColor:borderColor.CGColor];
    
    CALayer *topLayer = self.layer.sublayers.lastObject;
    if ([topLayer isKindOfClass:[CAShapeLayer class]]) {
        [topLayer removeFromSuperlayer];
    }
    [self.layer addSublayer:roundedCornerLayer];
    
    roundedCornerLayer.position = (CGPoint){ -onePixelInPoint, -onePixelInPoint };
}

@end
