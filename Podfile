# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'project_calendar' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for project_calendar
pod 'SnapKit'
pod 'DateToolsSwift'
pod 'SwiftyJSON'
pod 'lottie-ios'
pod 'CryptoSwift'
pod 'LookinServer', :configurations => ['Debug']

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end
