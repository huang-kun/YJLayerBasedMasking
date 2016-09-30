//
//  CAShapeLayer+YJLayerBasedMasking.m
//  YJLayerBasedMasking
//
//  Created by huang-kun on 16/5/5.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "CAShapeLayer+YJLayerBasedMasking.h"
#import "UIBezierPath+YJLayerBasedMasking.h"

@implementation CAShapeLayer (YJLayerBasedMasking)

+ (instancetype)yj_maskLayerForBezierPath:(UIBezierPath *)bezierPath fillColor:(CGColorRef)fillColor {
    CAShapeLayer *maskLayer = [self layer];
    maskLayer.fillColor = fillColor;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.path = bezierPath.CGPath;
    return maskLayer;
}

+ (instancetype)yj_maskLayerForFrameBezierPath:(UIBezierPath *)frameBezierPath shapeBezierPath:(UIBezierPath *)shapeBezierPath fillColor:(CGColorRef)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(CGColorRef)strokeColor {
    
    // create a mask layer
    CAShapeLayer *maskLayer = [self layer];
    maskLayer.fillColor = fillColor;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.strokeColor = fillColor; // cover the rect path of corner
    maskLayer.lineWidth = strokeWidth;
    
    UIBezierPath *cornerPath = nil;
    if (UIDevice.currentDevice.systemVersion.floatValue >= 8.0) {
        cornerPath = [shapeBezierPath copy];
    } else {
        cornerPath = [UIBezierPath bezierPathWithCGPath:shapeBezierPath.CGPath];
    }
    
    [cornerPath appendPath:frameBezierPath];
    maskLayer.path = cornerPath.CGPath;
    
    if (!strokeWidth) {
        return maskLayer;
    }
    
    // if stroke, then create a stroke layer
    CAShapeLayer *strokeLayer = [CAShapeLayer layer];
    strokeLayer.fillColor = nil;
    strokeLayer.strokeColor = strokeColor;
    strokeLayer.lineWidth = strokeWidth;
    strokeLayer.path = shapeBezierPath.CGPath;
    [maskLayer addSublayer:strokeLayer];
    
    return maskLayer;
}

+ (instancetype)yj_circularMaskLayerInSize:(CGSize)size fillColor:(CGColorRef)fillColor {
    return [self yj_circularMaskLayerInSize:size fillColor:fillColor strokeWidth:0.0f strokeColor:fillColor];
}

// default implementation - shape path is offset by 2 pixels from size boundary
+ (instancetype)yj_circularMaskLayerInSize:(CGSize)size fillColor:(CGColorRef)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(CGColorRef)strokeColor {
    
    UIBezierPath *framePath, *circularPath;
    CGSize innerSize = CGSizeMake(size.width - strokeWidth / 2, size.height - strokeWidth / 2);
    CGFloat twoPixelInPoint = 2 / UIScreen.mainScreen.scale;
    
    [UIBezierPath yj_bezierPathWithCircleMaskShapeInSize:innerSize
                                           edgeInsets:(UIEdgeInsets){ twoPixelInPoint, twoPixelInPoint, twoPixelInPoint, twoPixelInPoint }
                                       outerFramePath:&framePath
                                      innerCirclePath:&circularPath];
    
    return [self yj_maskLayerForFrameBezierPath:framePath
                             shapeBezierPath:circularPath
                                   fillColor:fillColor
                                 strokeWidth:strokeWidth
                                 strokeColor:strokeColor];
}

+ (instancetype)yj_roundedRectMaskLayerInSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius fillColor:(CGColorRef)fillColor {
    return [self yj_roundedRectMaskLayerInSize:size cornerRadius:cornerRadius fillColor:fillColor strokeWidth:0.0f strokeColor:fillColor];
}

// default implementation - shape path is offset by 2 pixels from size boundary
+ (instancetype)yj_roundedRectMaskLayerInSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius fillColor:(CGColorRef)fillColor strokeWidth:(CGFloat)strokeWidth strokeColor:(CGColorRef)strokeColor {
    
    UIBezierPath *framePath, *roundedPath;
    CGSize innerSize = CGSizeMake(size.width - strokeWidth / 2, size.height - strokeWidth / 2);
    CGFloat twoPixelInPoint = 2 / UIScreen.mainScreen.scale;
    
    [UIBezierPath yj_bezierPathWithRoundedCornerMaskShapeInSize:innerSize
                                                cornerRadius:cornerRadius
                                                  edgeInsets:(UIEdgeInsets){ twoPixelInPoint, twoPixelInPoint, twoPixelInPoint, twoPixelInPoint }
                                              outerFramePath:&framePath
                                              innerRoundPath:&roundedPath];
    
    return [self yj_maskLayerForFrameBezierPath:framePath
                             shapeBezierPath:roundedPath
                                   fillColor:fillColor
                                 strokeWidth:strokeWidth
                                 strokeColor:strokeColor];
}

@end
