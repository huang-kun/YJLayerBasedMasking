
Pod::Spec.new do |s|
  s.name             = 'YJLayerBasedMasking'
  s.version          = '0.1.0'
  s.summary          = 'A light-weight and high-performance approach to get circular or rounded corner UIImageView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Getting circular or rounded corner image to display on UIImageView is easy by using YJLayerBasedMasking.
                       DESC

  s.homepage         = 'https://github.com/huang-kun/YJLayerBasedMasking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huang-kun' => 'jack-huang-developer@foxmail.com' }
  s.source           = { :git => 'https://github.com/huang-kun/YJLayerBasedMasking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'YJLayerBasedMasking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YJLayerBasedMasking' => ['YJLayerBasedMasking/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
