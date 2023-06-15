#
# Be sure to run `pod lib lint OkMatrix.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OkMatrix'
  s.version          = '1.0'
  s.summary          = '1：重新构建podspec，将C++私有头文件，隐藏起来，否则会报错 2：原版英文介绍 A flexible Matrix library for Objective-C and Swift, that interfaces BLAS, LAPACK and vDSP functions via the Accelerate Framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/willlzq/OkMatrix'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'willlzq' => 'willlzq@hotmail.com' }
  s.source           = { :git => 'https://github.com/willlzq/OkMatrix.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  
  s.source_files = 'OkMatrix/Classes/**/*'
 
  s.public_header_files = 'OkMatrix/Classes/**/*.h'
  s.private_header_files = 'OkMatrix/Classes/PrivateHeader/*.{h}'

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  
 
  
  
#   mrc_files = 'BQWebTextScan/Classes/GTMNSString-HTML-master/NSString+HTML.m'
#   s.exclude_files = mrc_files
#   s.subspec 'no-arc' do |sp|
#      sp.source_files = mrc_files
#      sp.requires_arc = false
#  end
#   s.resource_bundles = {
#     'BQWebTextScan' => ['BQWebTextScan/Assets/*.png']
#   }
 
  ##s.public_header_files = 'BQWebTextScan/Classes/Algorithms/*.{h},BQWebTextScan/Classes/*.{h}'
 
  #s.frameworks = 'UIKit', 'MapKit'
 

  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
end
