#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ChindleKit'
  s.version          = '1'
  s.summary          = 'A short description of ChindleKit.'
  
  s.description      = <<-DESC
  Contains the decomponents for Design System.
  DESC
  
  s.homepage         = 'https://github.com/zhuxiaod/ChindleBaseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuxiaod' => 'zhuxiaod_183202114@qq.com' }
  s.source           = { :git => 'https://github.com/zhuxiaod/ChindleBaseKit.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '12.0'
  
  s.swift_versions = '5.0'
  
  # s.source_files = 'ChindleKit/**/*'
  s.source_files = 'ChindleKit/Classes/**/**/*.{h,m,swift}'
  
  s.static_framework = true
  
  s.frameworks = ['UIKit', 'Photos']
  
  s.dependency 'MJRefresh'
  s.dependency 'LYEmptyView'
  s.dependency 'YYKit'
  s.dependency 'SVProgressHUD'
  s.dependency 'Then'
  s.dependency 'Toast'
  s.dependency 'SnapKit'
  
  s.requires_arc = true
  
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'DEFINES_MODULE' => 'YES',
    'VALID_ARCHS' => 'x86_64 armv7 arm64'
  }
  
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
end

