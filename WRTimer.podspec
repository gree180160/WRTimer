

Pod::Spec.new do |s|
  s.name             = 'WRTimer'
  s.version          = '1.0.0'
  s.summary          = 'DispatchSourceTimer '

  s.description      = <<-DESC
本示例采用DispatchSourceTimer + 中介者消息转发机制 来解决上述的两个问题 。WRGCDTimerWrapper 封装了DispatchSourceTimer
                       DESC

  s.homepage         = 'https://github.com/gree180160/WRTimer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gree180160' => '1459287460@qq.com' }
  s.source           = { :git => 'https://github.com/gree180160/WRTimer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'WRTimer/Classes/*'
  
  # s.resource_bundles = {
  #   'WRTimer' => ['WRTimer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
