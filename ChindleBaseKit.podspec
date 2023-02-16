#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ChindleBaseKit'
  s.version          = '0.1.2'
  s.summary          = 'A short description of ChindleBaseKit.'
  
  s.description      = <<-DESC
Contains the decomponents for Design System.
                       DESC

  s.homepage         = 'https://github.com/zhuxiaod/ChindleBaseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuxiaod' => 'zhuxiaod_183202114@qq.com' }
  s.source           = { :git => 'https://github.com/zhuxiaod/ChindleBaseKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_versions = '5.0'

  s.source_files = 'ChindleBaseKit/Classes/**/*'
  
  s.frameworks = 'UIKit'
  s.dependency 'MJRefresh'
  s.dependency 'LYEmptyView'
  s.dependency 'YYKit'
  s.dependency 'SVProgressHUD'
  s.dependency 'Then'

  
  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end

