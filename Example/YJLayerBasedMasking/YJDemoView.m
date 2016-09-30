//
//  YJDemoView.m
//  YJLayerBasedMasking
//
//  Created by huang-kun on 16/9/29.
//  Copyright © 2016年 huang-kun. All rights reserved.
//

#import "YJDemoView.h"
#import <YJLayerBasedMasking/YJLayerBasedMasking.h>

@implementation YJDemoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self addMultipleImageViews];
    }
    return self;
}

- (void)addMultipleImageViews {
    
    CGRect bounds = self.bounds;
    CGFloat offset = 5.0;
    CGFloat w = (bounds.size.width - offset * 5) / 4;

    CGFloat cornerRadius = 5.0;
    CGFloat borderWidth = 1.0;
    UIColor *borderColor = UIColor.orangeColor;
    
    // Image without alpha channel
    /*
     To check the alpha channel of an image, you can select the image in Finder, 
     press COMMAND + I, See the information:
     
     More Info:
     
     Dimensions: 256 x 256
     Color space: RGB
     Color profile: sRGB built-in
     Alpha channel: No
     
     */
    UIImage *image = [UIImage imageNamed:@"Puppy.jpg"];
    NSAssert(image != nil, @"The demo must need an image.");
    
    // default imageView
    UIImageView *v1 = [[UIImageView alloc] initWithFrame:(CGRect){offset, offset + 20, w, w}];
    v1.image = image;
    [self addSubview:v1];
    
    
    /*
     
     Default circular imageView
     
     Color blended layers testing:        BAD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               YES
     Flexibility:                         GOOD
     Performance:                         OK
     
     */
    UIImageView *v2 = [[UIImageView alloc] initWithFrame:(CGRect){offset, CGRectGetMaxY(v1.frame) + offset, w, w}];
    v2.image = image;
    v2.layer.cornerRadius = w / 2;
    v2.layer.masksToBounds = YES;
    [self addSubview:v2];
    
    
    /* 
     
     Default circular imageView with border
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    BAD
     Alpha channel support:               YES
     Flexibility:                         GOOD
     Performance:                         OK
     
     */
    UIImageView *v3 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v1.frame) + offset, CGRectGetMaxY(v1.frame) + offset, w, w}];
    v3.image = image;
    v3.layer.cornerRadius = w / 2;
    v3.layer.masksToBounds = YES;
    v3.layer.borderWidth = borderWidth;
    v3.layer.borderColor = borderColor.CGColor;
    [self addSubview:v3];
    

    /*
     
     Default rounded corner imageView
     
     Color blended layers testing:        BAD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               YES
     Flexibility:                         GOOD
     Performance:                         OK
     
     */
    UIImageView *v4 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v3.frame) + offset, CGRectGetMaxY(v1.frame) + offset, w, w}];
    v4.image = image;
    v4.layer.cornerRadius = cornerRadius;
    v4.layer.masksToBounds = YES;
    [self addSubview:v4];
    

    /*
     
     Default rounded corner imageView with border
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    OK
     Alpha channel support:               YES
     Flexibility:                         GOOD
     Performance:                         OK
     
     */
    UIImageView *v5 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v4.frame) + offset, CGRectGetMaxY(v1.frame) + offset, w, w}];
    v5.image = image;
    v5.layer.cornerRadius = cornerRadius;
    v5.layer.masksToBounds = YES;
    v5.layer.borderWidth = borderWidth;
    v5.layer.borderColor = borderColor.CGColor;
    [self addSubview:v5];
    

    /*
     
     Layer covered imageView for circular image effect
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               NO
     Flexibility:                         BAD
     Performance:                         GOOD
     
     */
    UIImageView *v6 = [[UIImageView alloc] initWithFrame:(CGRect){offset, CGRectGetMaxY(v2.frame) + offset, w, w}];
    v6.image = image;
    [v6 yj_addCircularShapeLayerWithColor:self.backgroundColor];
    [self addSubview:v6];
    

    /*
     
     Layer covered imageView for circular image effect with border
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               NO
     Flexibility:                         BAD
     Performance:                         GOOD
     
     */
    UIImageView *v7 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v6.frame) + offset, CGRectGetMaxY(v2.frame) + offset, w, w}];
    v7.image = image;
    [v7 yj_addCircularShapeLayerWithColor:self.backgroundColor borderWidth:borderWidth borderColor:borderColor];
    [self addSubview:v7];
    

    /*
     
     Layer covered imageView for rounded corner image effect
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               NO
     Flexibility:                         BAD
     Performance:                         GOOD
     
     */
    UIImageView *v8 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v7.frame) + offset, CGRectGetMaxY(v2.frame) + offset, w, w}];
    v8.image = image;
    [v8 yj_addRoundedCornerShapeLayerWithColor:self.backgroundColor cornerRadius:cornerRadius];
    [self addSubview:v8];
    

    /*
     
     Layer covered imageView for rounded corner image effect with border
     
     Color blended layers testing:        GOOD
     Color offscreen-rendered testing:    GOOD
     Alpha channel support:               NO
     Flexibility:                         BAD
     Performance:                         GOOD
     
     */
    UIImageView *v9 = [[UIImageView alloc] initWithFrame:(CGRect){CGRectGetMaxX(v8.frame) + offset, CGRectGetMaxY(v2.frame) + offset, w, w}];
    v9.image = image;
    [v9 yj_addRoundedCornerShapeLayerWithColor:self.backgroundColor cornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor];
    [self addSubview:v9];
}

@end
