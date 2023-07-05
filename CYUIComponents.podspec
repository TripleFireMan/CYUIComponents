#
# Be sure to run `pod lib lint CYUIComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CYUIComponents'
  s.version      = "0.1.27"
  s.summary          = 'A short description of CYUIComponents.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = 'swift 版本的UI组件库，用于日常开发'

  s.homepage         = 'https://github.com/TripleFireMan/CYUIComponents.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chengyan' => 'ab364743113@126.com' }
  s.source           = { :git => 'git@github.com:TripleFireMan/CYUIComponents.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '11.0'

  s.source_files = 'CYUIComponents/Classes/**/*'
  s.swift_versions = '5.0'
  s.resource_bundles = {
     'CYUIComponents' => ['CYUIComponents/Assets/*','CYUIComponents/Classes/**/*.xib']
   }
  s.dependency 'SnapKit'
  s.dependency 'YYCategories'
  s.dependency 'SDWebImage'
end
