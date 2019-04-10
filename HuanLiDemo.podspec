Pod::Spec.new do |s|
  s.name         = "HuanLiDemo"
  s.version      = "1.0"
  s.summary      = "环锂运营位"
  s.description  = <<-DESC
                   环锂运营位SDK
                    DESC
  s.homepage     = "https://github.com/chao409/CCTest.git"
  s.license      = "MIT"
  s.author       = { "caochao" => "770646526@qq.com" }
  s.platform     = :ios,"10.0"
  s.source       = { :git => "https://github.com/chao409/CCTest.git", :tag => "1.0" }
  s.frameworks = "CFNetwork","Photos","CoreGraphics","Foundation","AVFoundation","CoreText","UIKit","Secrity","SystemConfiguration","ImageIO","QuartzCore","libc","libsqlite3","libz"
  s.vendored_frameworks = 'HuanLiDemo/sdks/**/*.framework'

end
