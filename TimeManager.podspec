
Pod::Spec.new do |s|

  s.name         = "TimeManager"
  s.version      = "1.0.3"
  s.summary      = "A delightful setting interface framework."
  s.homepage     = "https://github.com/liujunzhang007/TimeManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "liujunzhang007" => "liujunzhang007@sina.cn" }
  s.ios.deployment_target = "10.2"
  s.source       = { :git => "https://github.com/liujunzhang007/TimeManager.git", :tag => "s.version" }
  s.source_files  = "TimeManager/*.{h,m}"
  s.requires_arc = true
  s.resources          = "TimeManager/TimeManager.bundle"

end
