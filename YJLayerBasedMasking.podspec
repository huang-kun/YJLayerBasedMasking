
Pod::Spec.new do |s|
  s.name             = 'YJLayerBasedMasking'
  s.version          = '0.1.0'
  s.summary          = 'A light-weight and high-performance approach to get circular or rounded corner UIImageView.'

  s.description      = <<-DESC
Getting circular or rounded corner image to display on UIImageView is easy by using YJLayerBasedMasking.
                       DESC

  s.homepage         = 'https://github.com/huang-kun/YJLayerBasedMasking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huang-kun' => 'jack-huang-developer@foxmail.com' }
  s.source           = { :git => 'https://github.com/huang-kun/YJLayerBasedMasking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'YJLayerBasedMasking/**/*'
  s.public_header_files = 'YJLayerBasedMasking/**/*.h'
end
