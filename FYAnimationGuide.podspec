Pod::Spec.new do |s|
  s.name         = "FYAnimationGuide"
  s.version      = "0.0.3"
  s.summary      = "A Simple Drop-in Guide View with Animation"
  s.homepage     = "https://github.com/chenzeyu/FYAnimationGuide"
  s.license      = "MIT"
  s.author       = { "Chen Zeyu" => "zeyufly@gmail.com" }
  s.source       = { :git => "https://github.com/chenzeyu/FYAnimationGuide.git", :tag => s.version.to_s }
  s.source_files = "FYWelcomeView/FYAnimationGuideView.{h,m}", "FYWelcomeView/FYGuidePage.{h,m}"
  s.requires_arc = true
  s.platform = :ios, '6.0'
  s.dependency "pop", "~> 1.0"
end
