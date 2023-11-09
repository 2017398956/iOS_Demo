# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
#source 'https://github.com/CocoaPods/Specs.git'
#如果之前没有安装过 cocoapods ，这里先用清华的源下载，不要先 pod install
#1.cd ~/.cocoapods/repos
#2.git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git --depth 1
#3.pod install
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

workspace 'iOS_Demo.xcworkspace'

target 'AppBase' do
  project 'AppBase/AppBase.xcodeproj'
  use_frameworks!
#  pod 'AFNetworking'
end

target 'iOS_Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'QMUIKit'
  pod 'AFNetworking/NSURLSession', '3.2.1'
  pod 'AFNetworking/Reachability', '3.2.1'
  pod 'AFNetworking/Security', '3.2.1'
  pod 'AFNetworking/Serialization', '3.2.1'
  pod 'Socket.IO-Client-Swift', '~> 15.0.0'

#  pod 'irtc-sdk-pod', :git => "git@bitbucket.org:zealcomm/irtc-sdk-pod.git", :tag => '4.4.1'

  target 'iOS_DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOS_DemoUITests' do
    # Pods for testing
  end

end


post_install do |installer|
#  installer.pods_project.build_configurations.each do |config|
#    config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
#    config.build_settings['VALID_ARCHS'] = 'arm64 arm64e armv7 armv7s x86_64 i386' # 针对 apple m1 芯片
#    config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'  # 针对 apple m1 芯片
#  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
