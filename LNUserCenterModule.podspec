#
# Be sure to run `pod lib lint LNUserCenterModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LNUserCenterModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LNUserCenterModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/NoNameOrganazation/LNUserCenterModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dongjianxiong' => 'jianxiong20090919@126.com' }
  s.source           = { :git => 'https://github.com/NoNameOrganazation/LNUserCenterModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'LNUserCenterModule/Classes/**/*'
  s.subspec 'Network' do |network|
    network.source_files = 'LNUserCenterModule/Classes/Network/**/*'
    network.public_header_files = 'LNUserCenterModule/Classes/Network/*.h'
  end
  
  s.subspec 'Base' do |base|
    base.source_files = 'LNUserCenterModule/Classes/Base/**/*'
    base.public_header_files = 'LNUserCenterModule/Classes/Base/*.h'
    # 自有subspec
    base.dependency 'LNUserCenterModule/Network'
    # 公有库
    base.dependency 'MJRefresh'
    base.dependency 'SDWebImage'
    base.dependency 'AFNetworking'
    
  end
  
  s.subspec 'Feature' do |feature|
    feature.source_files = 'LNUserCenterModule/Classes/Feature/**/*.{h,m}'
    feature.public_header_files = 'LNUserCenterModule/Classes/Feature/**/*.h'
    feature.resource_bundles = {
      'LNUserCenterModule' => ['LNUserCenterModule/Classes/Feature/**/*.xib', 'LNUserCenterModule/Classes/**/*.{png,jpg,jpeg}']
    }
    feature.dependency 'LNUserCenterModule/Base'
  end
  
  s.subspec 'Mediator' do |mediator|
    mediator.source_files = 'LNUserCenterModule/Classes/Mediator/**/*'
    mediator.dependency 'LNUserCenterModule/Feature'
  end
  
  s.dependency 'LNModuleProtocol'
  s.dependency 'LNCommonKit'
  
  # s.resource_bundles = {
  #   'LNUserCenterModule' => ['LNUserCenterModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
