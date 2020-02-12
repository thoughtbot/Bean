#
#  Be sure to run `pod spec lint Bean.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "Bean"
  spec.version      = "1.0"
  spec.summary      = "Simplify documents"
  spec.homepage     = "https://github.com/thoughtbot/Bean"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author = {
    'Abe Mangona' => 'abe@thoughtbot.com',
    'thoughtbot' => nil,
  }
  spec.social_media_url = 'http://twitter.com/thoughtbot'
  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"
  spec.source       = { :git => "https://github.com/thoughtbot/Bean.git", :tag => "v#{spec.version}" }
  spec.source_files  = "Bean/*.{swift,h}"

end
