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
  
  pod 'AFNetworking'

#  pod 'irtc-sdk-pod', :git => "git@bitbucket.org:zealcomm/irtc-sdk-pod.git", :tag => '4.4.1'

  target 'iOS_DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOS_DemoUITests' do
    # Pods for testing
  end

end
