# YJLayerBasedMasking

[![CI Status](http://img.shields.io/travis/huang-kun/YJLayerBasedMasking.svg?style=flat)](https://travis-ci.org/huang-kun/YJLayerBasedMasking)
[![Version](https://img.shields.io/cocoapods/v/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)
[![License](https://img.shields.io/cocoapods/l/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)
[![Platform](https://img.shields.io/cocoapods/p/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)

## Why layer based masking ?

Using YJLayerBasedMasking to get circular or rounded corner image is simple, light-weight, without extra cost for blended layer and offscreen-rendering.

#### Get same results by setting layer.masksToBounds or using YJLayerBasedMasking

![effect](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img1.png)

#### Color blended layers testing (Green color means good, red color means cost)

![blended layer](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img2.png)

#### Color offscreen-rendering testing (Yellow color means cost)

![offscreen-rendered](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img3.png)

## How to use it ?

To display a circular UIImageView instance, just call this.

```
// circular imageView
[imageView yj_addCircularShapeLayerWithColor:backgroundColor];
// circular imageView with border
[imageView yj_addCircularShapeLayerWithColor:backgroundColor borderWidth:borderWidth borderColor:borderColor];
```

To display a rounded corner UIImageView instance, just call this.

```
// rounded corner imageView
[imageView yj_addRoundedCornerShapeLayerWithColor:backgroundColor cornerRadius:cornerRadius];
// rounded corner imageView with border
[imageView yj_addRoundedCornerShapeLayerWithColor:backgroundColor cornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor];
```

## Notice

1. This is not good for display rounded corner with transparency background.
2. This is not good for any view with its size changing constantly.
3. This is not good for any view with superview's background color changing constantly. (e.g. When user tap on UITableViewCell, it's background color becomes gray. To make the YJLayerBasedMasking working, either you can set cell's property to UITableViewCellSelectionStyleNone or change shape layer's color to match the new background color)

If you need to display a circular image effect with a good performance (e.g. display user's avatar image), then try YJLayerBasedMasking.

## Requirements

iOS 7+

## Installation

YJLayerBasedMasking is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "YJLayerBasedMasking"
```

## Author

huang-kun, jack-huang-developer@foxmail.com

## License

YJLayerBasedMasking is available under the MIT license. See the LICENSE file for more info.


