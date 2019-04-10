#
#  Be sure to run `pod spec lint HuanLiDemo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HuanLiDemo"
  s.version      = "0.0.1"
  s.summary      = "环锂运营位"
  s.description  = <<-DESC
                   环锂运营位SDK
  s.homepage     = "https://github.com/chao409/CCTest.git"
  s.license      = "MIT"
  s.author       = { "caochao" => "770646526@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/chao409/CCTest.git", :tag => "1.0" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
