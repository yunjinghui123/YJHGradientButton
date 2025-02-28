Pod::Spec.new do |spec|
  spec.name         = "YJHGradientButton"
  spec.version      = "0.0.7"
  spec.summary      = "A color gradient button"
  spec.homepage     = "https://github.com/yunjinghui123/YJHGradientButton"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "yunjinghui" => "1432680302@qq.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHGradientButton.git", :tag => "#{spec.version}" }
  spec.requires_arc = true
  spec.source_files  = "YJHGradientButton/**/*.{h,m}"
  spec.resource_bundles = {'YJHGradientButton' => ['YJHGradientButton/**/Resources/PrivacyInfo.xcprivacy']}
end
