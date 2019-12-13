Pod::Spec.new do |spec|
  spec.name         = "YJHGradientButton"
  spec.version      = "0.0.4"
  spec.summary      = "A color gradient button"
  spec.homepage     = "https://github.com/yunjinghui123/YJHGradientButton"
  spec.license      = "MIT"
  spec.author       = { "yunjinghui" => "1432680302@qq.com" }
  spec.platform     = :ios, "6.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHGradientButton.git", :tag => "#{spec.version}" }
  spec.source_files  = "YJHGradientButton", "YJHGradientButton/**/*.{h,m}"
  spec.requires_arc = true
end
