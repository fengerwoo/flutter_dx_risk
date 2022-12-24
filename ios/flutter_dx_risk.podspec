#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_dx_risk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_dx_risk'
  s.version          = '0.0.1'
  s.summary          = 'flutter_dx_risk plugin'
  s.description      = <<-DESC
flutter_dx_risk plugin
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h', ''
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.vendored_frameworks = 'Frameworks/DXRiskStatic.framework' # 配置顶象指纹 framework
  s.frameworks = ["DXRiskStatic", "SystemConfiguration" , "CoreLocation" , "CoreTelephony" ] # 顶象系统依赖（framework）
  s.libraries = ["z", "resolv", "c++"] # 顶象系统依赖（lib）
  

#  s.frameworks = 'DXRiskStatic' #依赖xxx庫，会添加到插件项目 Frameworks and Libraries中
#  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
