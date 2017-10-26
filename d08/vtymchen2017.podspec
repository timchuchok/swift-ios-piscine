#
# Be sure to run `pod lib lint vtymchen2017.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'vtymchen2017'
  s.version          = '0.1.0'
  s.summary          = 'A simply pod for d08 of swift piscine.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "pod for my next project in which i will use Core Data"

  s.homepage         = 'https://github.com/timchuchok/swift-ios-piscine'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'timchuchok' => 'timchenko.vlad@gmail.com' }
  s.source           = { :git => 'https://github.com/timchuchok//swift-ios-piscine/d08.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'vtymchen2017/Classes/**/*'
  
  # s.resource_bundles = {
  #   'vtymchen2017' => ['vtymchen2017/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
