# YJLayerBasedMasking

[![CI Status](http://img.shields.io/travis/huang-kun/YJLayerBasedMasking.svg?style=flat)](https://travis-ci.org/huang-kun/YJLayerBasedMasking)
[![Version](https://img.shields.io/cocoapods/v/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)
[![License](https://img.shields.io/cocoapods/l/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)
[![Platform](https://img.shields.io/cocoapods/p/YJLayerBasedMasking.svg?style=flat)](http://cocoapods.org/pods/YJLayerBasedMasking)

## Why layer based masking ?

Using YJLayerBasedMasking to get circular or rounded corner image is simple, light-weight, without extra cost for blended layer and offscreen-rendering.

Get same results by setting layer.masksToBounds or using YJLayerBasedMasking
![effect](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img1.png)

Color blended layers testing (Green color means good, red color means cost)
![blended layer](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img2.png)

Color offscreen-rendering testing (Yellow color means cost)
![offscreen-rendered](https://github.com/huang-kun/YJLayerBasedMasking/blob/master/img3.png)

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


