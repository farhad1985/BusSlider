Pod::Spec.new do |s|
  s.name             = 'BusSlider'
  s.version          = '1.0.0'
  s.summary          = 'BusSlider is a custom slider. by : farhad faramarzi'

 
  s.homepage         = 'https://github.com/farhad1985/BusSlider'
  s.author           = { 'Farhad Faramarzi' => 'farhad.public@gmail.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/farhad1985/BusSlider.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.0'
  s.source_files = 'BusSlider/**/*'
  s.exclude_files = 'BusSlider/*.plist'
  s.swift_version = '5'

end
